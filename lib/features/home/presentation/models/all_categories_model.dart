class Category {
  final int id;
  final int? parentId;
  final String name;
  final String slug;
  final String? disc;
  final String status;
  final String imageUrl;

  Category({
    required this.id,
    this.parentId,
    required this.name,
    required this.slug,
    this.disc,
    required this.status,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      parentId: json['parent_id'],
      name: json['name'],
      slug: json['slug'],
      disc: json['disc'],
      status: json['status'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_id': parentId,
      'name': name,
      'slug': slug,
      'disc': disc,
      'status': status,
      'image_url': imageUrl,
    };
  }
}

List<Category> parseCategories(List<dynamic> jsonList) {
  return jsonList.map((json) => Category.fromJson(json)).toList();
}
