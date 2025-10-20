import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// TTS（Text-to-Speech）の状態管理を行うProvider
class TtsProvider with ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;
  double _speechRate = 0.7; // デフォルトの読み上げ速度（元の70% = 表示上100%）
  List<Map<String, String>> _availableVoices = [];
  Map<String, String>? _selectedVoice;

  TtsProvider() {
    _initializeTts();
  }

  bool get isSpeaking => _isSpeaking;
  double get speechRate => _speechRate;
  List<Map<String, String>> get availableVoices => _availableVoices;
  Map<String, String>? get selectedVoice => _selectedVoice;
  
  /// 表示用の速度パーセンテージを取得（70%を基準100%とする）
  int get displaySpeedPercentage => ((_speechRate / 0.7) * 100).round();

  /// TTSの初期化
  Future<void> _initializeTts() async {
    try {
      // 保存された速度設定を読み込む
      await _loadSpeechRate();

      // 言語を日本語に設定
      await _flutterTts.setLanguage('ja-JP');

      // 利用可能な音声を取得
      await _loadAvailableVoices();

      // 保存された音声設定を読み込む
      await _loadSelectedVoice();

      // 音声設定
      await _flutterTts.setSpeechRate(_speechRate); // 読み上げ速度
      await _flutterTts.setVolume(1.0); // 音量（0.0〜1.0）
      await _flutterTts.setPitch(1.0); // ピッチ（0.5〜2.0）

      // 読み上げ開始時のコールバック
      _flutterTts.setStartHandler(() {
        _isSpeaking = true;
        notifyListeners();
        if (kDebugMode) {
          print('TTS: Speaking started');
        }
      });

      // 読み上げ完了時のコールバック
      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
        notifyListeners();
        if (kDebugMode) {
          print('TTS: Speaking completed');
        }
      });

      // エラー発生時のコールバック
      _flutterTts.setErrorHandler((msg) {
        _isSpeaking = false;
        notifyListeners();
        if (kDebugMode) {
          print('TTS Error: $msg');
        }
      });

      if (kDebugMode) {
        print('TTS initialized successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('TTS initialization error: $e');
      }
    }
  }

  /// テキストを読み上げる
  Future<void> speak(String text) async {
    if (text.trim().isEmpty) {
      if (kDebugMode) {
        print('TTS: Empty text, skipping');
      }
      return;
    }

    try {
      // すでに読み上げ中の場合は停止
      if (_isSpeaking) {
        await stop();
      }

      await _flutterTts.speak(text);
      if (kDebugMode) {
        print('TTS: Speaking "$text"');
      }
    } catch (e) {
      if (kDebugMode) {
        print('TTS speak error: $e');
      }
      _isSpeaking = false;
      notifyListeners();
    }
  }

  /// 読み上げを停止
  Future<void> stop() async {
    try {
      await _flutterTts.stop();
      _isSpeaking = false;
      notifyListeners();
      if (kDebugMode) {
        print('TTS: Stopped');
      }
    } catch (e) {
      if (kDebugMode) {
        print('TTS stop error: $e');
      }
    }
  }

  /// 保存された読み上げ速度を読み込む
  Future<void> _loadSpeechRate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _speechRate = prefs.getDouble('speech_rate') ?? 0.7;
      if (kDebugMode) {
        print('Loaded speech rate: $_speechRate (display: ${displaySpeedPercentage}%)');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading speech rate: $e');
      }
      _speechRate = 0.7; // エラー時はデフォルト値（元の70% = 表示上100%）
    }
  }

  /// 読み上げ速度を変更
  Future<void> setSpeechRate(double rate) async {
    if (rate < 0.35 || rate > 1.75) return;

    _speechRate = rate;
    notifyListeners();

    try {
      await _flutterTts.setSpeechRate(rate);
      
      // 速度設定を保存
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('speech_rate', rate);
      
      if (kDebugMode) {
        print('Speech rate set to: $rate');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error setting speech rate: $e');
      }
    }
  }

  /// 利用可能な音声を取得（最初の4つの日本語音声）
  Future<void> _loadAvailableVoices() async {
    try {
      final voices = await _flutterTts.getVoices as List<dynamic>;
      final allJapaneseVoices = voices
          .where((voice) => voice['locale']?.toString().startsWith('ja') ?? false)
          .map((voice) => {
                'name': voice['name']?.toString() ?? '',
                'locale': voice['locale']?.toString() ?? '',
              })
          .toList();

      // 最初の4つの音声のみを使用
      _availableVoices = allJapaneseVoices.take(4).toList();

      if (kDebugMode) {
        print('Found ${_availableVoices.length} Japanese voices (limited to 4)');
        for (var i = 0; i < _availableVoices.length; i++) {
          print('  音声${i + 1}: ${_availableVoices[i]['name']}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading voices: $e');
      }
      _availableVoices = [];
    }
  }

  /// 保存された音声設定を読み込む
  Future<void> _loadSelectedVoice() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final voiceName = prefs.getString('selected_voice_name');
      final voiceLocale = prefs.getString('selected_voice_locale');

      if (voiceName != null && voiceLocale != null) {
        _selectedVoice = {
          'name': voiceName,
          'locale': voiceLocale,
        };

        // 音声を設定
        await _flutterTts.setVoice({'name': voiceName, 'locale': voiceLocale});

        if (kDebugMode) {
          print('Loaded voice: $voiceName ($voiceLocale)');
        }
      } else if (_availableVoices.isNotEmpty) {
        // 初回起動時はデフォルト音声を設定
        final defaultVoice = _availableVoices.first;
        await setVoice(defaultVoice);
        
        if (kDebugMode) {
          print('Set default voice: ${defaultVoice['name']}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading selected voice: $e');
      }
    }
  }

  /// 音声を設定
  Future<void> setVoice(Map<String, String> voice) async {
    try {
      await _flutterTts.setVoice(voice);
      _selectedVoice = voice;
      notifyListeners();

      // 音声設定を保存
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_voice_name', voice['name'] ?? '');
      await prefs.setString('selected_voice_locale', voice['locale'] ?? '');

      if (kDebugMode) {
        print('Voice set to: ${voice['name']} (${voice['locale']})');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error setting voice: $e');
      }
    }
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }
}

