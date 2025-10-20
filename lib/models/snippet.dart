/// スニペット（定型文）のデータモデル
class Snippet {
  final String id;
  final String text;
  final int order;

  Snippet({
    required this.id,
    required this.text,
    required this.order,
  });

  /// JSONからSnippetオブジェクトを生成
  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      id: json['id'] as String,
      text: json['text'] as String,
      order: json['order'] as int,
    );
  }

  /// SnippetオブジェクトをJSONに変換
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'order': order,
    };
  }

  /// スニペットのコピーを作成（一部のプロパティを変更可能）
  Snippet copyWith({
    String? id,
    String? text,
    int? order,
  }) {
    return Snippet(
      id: id ?? this.id,
      text: text ?? this.text,
      order: order ?? this.order,
    );
  }

  @override
  String toString() {
    return 'Snippet(id: $id, text: $text, order: $order)';
  }
}


