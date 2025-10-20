import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/snippet.dart';

/// スニペットの状態管理を行うProvider
class SnippetProvider with ChangeNotifier {
  List<Snippet> _snippets = [];
  bool _isLoading = false;

  List<Snippet> get snippets => _snippets;
  bool get isLoading => _isLoading;

  /// デフォルトのスニペット
  static const List<Map<String, dynamic>> _defaultSnippets = [
    {'id': '1', 'text': 'ありがとうございます', 'order': 0},
    {'id': '2', 'text': 'すみません', 'order': 1},
    {'id': '3', 'text': '了解しました', 'order': 2},
    {'id': '4', 'text': 'お願いします', 'order': 3},
    {'id': '5', 'text': '少々お待ちください', 'order': 4},
    {'id': '6', 'text': '大丈夫です', 'order': 5},
    {'id': '7', 'text': '風邪で声が出ません', 'order': 6},
    {'id': '8', 'text': 'お会計お願いします', 'order': 7},
    {'id': '9', 'text': '袋は不要です', 'order': 8},
    {'id': '10', 'text': '温めてください', 'order': 9},
    {'id': '11', 'text': 'お水ください', 'order': 10},
    {'id': '12', 'text': 'ちょっと待って', 'order': 11},
  ];

  SnippetProvider() {
    loadSnippets();
  }

  /// スニペットをローカルストレージから読み込む
  Future<void> loadSnippets() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final snippetsJson = prefs.getString('snippets');

      if (snippetsJson != null) {
        // 保存されたスニペットを読み込む
        final List<dynamic> jsonList = json.decode(snippetsJson);
        _snippets = jsonList
            .map((json) => Snippet.fromJson(json as Map<String, dynamic>))
            .toList();
        if (kDebugMode) {
          print('Loaded ${_snippets.length} snippets from storage');
        }
      } else {
        // 初回起動時はデフォルトスニペットを設定
        _snippets = _defaultSnippets
            .map((json) => Snippet.fromJson(json))
            .toList();
        await _saveSnippets();
        if (kDebugMode) {
          print('Initialized with default snippets');
        }
      }

      // orderでソート
      _snippets.sort((a, b) => a.order.compareTo(b.order));
    } catch (e) {
      if (kDebugMode) {
        print('Error loading snippets: $e');
      }
      // エラー時はデフォルトスニペットを使用
      _snippets = _defaultSnippets
          .map((json) => Snippet.fromJson(json))
          .toList();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// スニペットをローカルストレージに保存
  Future<void> _saveSnippets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final snippetsJson = json.encode(
        _snippets.map((snippet) => snippet.toJson()).toList(),
      );
      await prefs.setString('snippets', snippetsJson);
      if (kDebugMode) {
        print('Saved ${_snippets.length} snippets to storage');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving snippets: $e');
      }
    }
  }

  /// 新しいスニペットを追加
  Future<void> addSnippet(String text) async {
    if (text.trim().isEmpty) return;

    final newOrder = _snippets.isEmpty ? 0 : _snippets.map((s) => s.order).reduce((a, b) => a > b ? a : b) + 1;
    final newSnippet = Snippet(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text.trim(),
      order: newOrder,
    );

    _snippets.add(newSnippet);
    await _saveSnippets();
    notifyListeners();

    if (kDebugMode) {
      print('Added snippet: ${newSnippet.text}');
    }
  }

  /// スニペットを更新
  Future<void> updateSnippet(String id, String newText) async {
    if (newText.trim().isEmpty) return;

    final index = _snippets.indexWhere((s) => s.id == id);
    if (index != -1) {
      _snippets[index] = _snippets[index].copyWith(text: newText.trim());
      await _saveSnippets();
      notifyListeners();

      if (kDebugMode) {
        print('Updated snippet: $id -> $newText');
      }
    }
  }

  /// スニペットを削除
  Future<void> deleteSnippet(String id) async {
    _snippets.removeWhere((s) => s.id == id);
    await _saveSnippets();
    notifyListeners();

    if (kDebugMode) {
      print('Deleted snippet: $id');
    }
  }

  /// スニペットの順序を変更
  Future<void> reorderSnippets(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final snippet = _snippets.removeAt(oldIndex);
    _snippets.insert(newIndex, snippet);

    // orderを更新
    for (int i = 0; i < _snippets.length; i++) {
      _snippets[i] = _snippets[i].copyWith(order: i);
    }

    await _saveSnippets();
    notifyListeners();

    if (kDebugMode) {
      print('Reordered snippets: $oldIndex -> $newIndex');
    }
  }
}

