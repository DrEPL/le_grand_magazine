import 'dart:convert';

class Category {
  final String name;
  Category({
    required this.name,
  });

  Category copyWith({
    String? name,
  }) {
    return Category(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Category &&
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
