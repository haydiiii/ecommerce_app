// category_model.dart

class Category {
  final int id;
  final String name;
  final String slug;
  final String image;
  final List<Category> children;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.children,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      children: (json['children'] as List)
          .map((child) => Category.fromJson(child))
          .toList(),
    );
  }
}