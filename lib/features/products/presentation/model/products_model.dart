class Product {
  int id;
  int storeId;
  int categoryId;
  String name;
  String slug;
  String description;
  double price;
  double? comparePrice;
  int rating;
  String type;
  String status;
  String imageUrl;

  Product({
    required this.id,
    required this.storeId,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.description,
    required this.price,
    this.comparePrice,
    required this.rating,
    required this.type,
    required this.status,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      storeId: json['store_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['disc'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      comparePrice: json['compare_price']?.toDouble(),
      rating: json['rating'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
class Pagination {
  int currentPage;
  List<Product> products;
  int lastPage;

  Pagination({
    required this.currentPage,
    required this.products,
    required this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'] ?? 1,
      products: List<Product>.from(json['data']['data'].map((x) => Product.fromJson(x))),
      lastPage: json['last_page'] ?? 1,
    );
  }
}
