class FavouriteModel {
  bool? success;
  String? msg;
  List<Data>? data;

  FavouriteModel({this.success, this.msg, this.data});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int storeId;
  int categoryId;
  String name;
  String slug;
  String disc;
  int price;
  int comparePrice;
  int rating;
  dynamic options;
  String type;
  String status;
  String imageUrl;

  Data({
    this.id,
    required this.storeId,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.disc,
    required this.price,
    required this.comparePrice,
    required this.rating,
    this.options,
    required this.type,
    required this.status,
    required this.imageUrl,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        storeId = json['store_id'],
        categoryId = json['category_id'],
        name = json['name'],
        slug = json['slug'],
        disc = json['disc'],
        price = json['price'],
        comparePrice = json['compare_price'],
        rating = json['rating'],
        options = json['options'],
        type = json['type'],
        status = json['status'],
        imageUrl = json['image_url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['store_id'] = storeId;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['slug'] = slug;
    data['disc'] = disc;
    data['price'] = price;
    data['compare_price'] = comparePrice;
    data['rating'] = rating;
    data['options'] = options;
    data['type'] = type;
    data['status'] = status;
    data['image_url'] = imageUrl;
    return data;
  }
}
