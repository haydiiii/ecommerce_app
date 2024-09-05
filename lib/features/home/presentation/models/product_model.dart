class Product {
  final int id;
  final int storeId;
  final int categoryId;
  final String name;
  final String slug;
  final String disc;
  final double price;
  final double? comparePrice;
  final int rating;
  final String type;
  final String status;
  final String imageUrl;

  Product({
    required this.id,
    required this.storeId,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.disc,
    required this.price,
    this.comparePrice,
    required this.rating,
    required this.type,
    required this.status,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      storeId: json['store_id'],
      categoryId: json['category_id'],
      name: json['name'],
      slug: json['slug'],
      disc: json['disc'],
      price: json['price'].toDouble(),
      comparePrice: json['compare_price']?.toDouble(),
      rating: json['rating'],
      type: json['type'],
      status: json['status'],
      imageUrl: json['image_url'],
    );
  }
}
