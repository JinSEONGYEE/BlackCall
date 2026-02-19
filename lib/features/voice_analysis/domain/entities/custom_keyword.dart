/// Domain entity for custom fraud keywords.
/// Refactored to plain class to avoid code generation issues in the current environment.
class CustomKeyword {
  final int id;
  final String keyword;
  final DateTime addedAt;

  CustomKeyword({
    required this.id,
    required this.keyword,
    required this.addedAt,
  });

  factory CustomKeyword.fromJson(Map<String, dynamic> json) {
    return CustomKeyword(
      id: json['id'] as int,
      keyword: json['keyword'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'keyword': keyword,
      'addedAt': addedAt.toIso8601String(),
    };
  }
}
