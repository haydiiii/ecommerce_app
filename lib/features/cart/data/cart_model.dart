class CartModel {
  bool? success;
  String? msg;
  List<Data>? data;

  CartModel({this.success, this.msg, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[]; // Corrected initialization of the list
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
  String name;
  String slug;
  int price;
  String quantity;
  String? imageUrl;

  Data({
    this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slug = json['slug'],
        price = json['price'],
        quantity = json['quantity'],
        imageUrl = json['image_url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['price'] = price;
    data['quantity'] = quantity;
    data['image_url'] = imageUrl;
    return data;
  }
}
