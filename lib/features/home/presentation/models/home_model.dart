class HomeModel {
  bool success;
  String msg;
  Data? data;

  HomeModel({required this.success, required this.msg, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      success: json['success'] ?? false,
      msg: json['msg'] ?? '',
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Carusels> carusels;
  List<Categories> categories;
  List<NewProd> newProd;
  List<TopProd> topProd;
  List<HotProd> hotProd;
  List<BestSellingProd> bestSellingProd;

  Data({
    required this.carusels,
    required this.categories,
    required this.newProd,
    required this.topProd,
    required this.hotProd,
    required this.bestSellingProd,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      carusels:
          (json['carusels'] as List).map((v) => Carusels.fromJson(v)).toList(),
      categories: (json['categories'] as List)
          .map((v) => Categories.fromJson(v))
          .toList(),
      newProd:
          (json['newProd'] as List).map((v) => NewProd.fromJson(v)).toList(),
      topProd:
          (json['topProd'] as List).map((v) => TopProd.fromJson(v)).toList(),
      hotProd:
          (json['hotProd'] as List).map((v) => HotProd.fromJson(v)).toList(),
      bestSellingProd: (json['bestSellingProd'] as List)
          .map((v) => BestSellingProd.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carusels'] = carusels.map((v) => v.toJson()).toList();
    data['categories'] = categories.map((v) => v.toJson()).toList();
    data['newProd'] = newProd.map((v) => v.toJson()).toList();
    data['topProd'] = topProd.map((v) => v.toJson()).toList();
    data['hotProd'] = hotProd.map((v) => v.toJson()).toList();
    data['bestSellingProd'] = bestSellingProd.map((v) => v.toJson()).toList();
    return data;
  }
}

class Carusels {
  int id;
  String image;

  Carusels({required this.id, required this.image});

  factory Carusels.fromJson(Map<String, dynamic> json) {
    return Carusels(
      id: json['id'] ?? 0,
      image: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = image;
    return data;
  }
}

class Categories {
  int id;
  String name;
  String slug;
  String image;
  List<Children> children;

  Categories({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.children,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image_url'] ?? '',
      children:
          (json['children'] as List).map((v) => Children.fromJson(v)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image_url'] = image;
    data['children'] = children.map((v) => v.toJson()).toList();
    return data;
  }
}

class Children {
  int id;
  String name;
  String slug;
  String image;

  Children({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image_url'] = image;
    return data;
  }
}

class NewProd {
  String store;
  String category;
  String name;
  String slug;
  String disc;
  String image;
  int price;
  int? comparePrice;
  int rating;
  String type;
  String status;

  NewProd({
    required this.store,
    required this.category,
    required this.name,
    required this.slug,
    required this.disc,
    required this.image,
    required this.price,
    this.comparePrice,
    required this.rating,
    required this.type,
    required this.status,
  });

  factory NewProd.fromJson(Map<String, dynamic> json) {
    return NewProd(
      store: json['store'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      disc: json['disc'] ?? '',
      image: json['image_url'] ?? '',
      price: json['price'] ?? 0,
      comparePrice: json['compare_price'],
      rating: json['rating'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store'] = store;
    data['category'] = category;
    data['name'] = name;
    data['slug'] = slug;
    data['disc'] = disc;
    data['image_url'] = image;
    data['price'] = price;
    data['compare_price'] = comparePrice;
    data['rating'] = rating;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}

class TopProd {
  String store;
  String category;
  String name;
  String slug;
  String disc;
  String image;
  int price;
  int? comparePrice;
  int rating;
  String type;
  String status;

  TopProd({
    required this.store,
    required this.category,
    required this.name,
    required this.slug,
    required this.disc,
    required this.image,
    required this.price,
    this.comparePrice,
    required this.rating,
    required this.type,
    required this.status,
  });

  factory TopProd.fromJson(Map<String, dynamic> json) {
    return TopProd(
      store: json['store'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      disc: json['disc'] ?? '',
      image: json['image_url'] ?? '',
      price: json['price'] ?? 0,
      comparePrice: json['compare_price'],
      rating: json['rating'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store'] = store;
    data['category'] = category;
    data['name'] = name;
    data['slug'] = slug;
    data['disc'] = disc;
    data['image_url'] = image;
    data['price'] = price;
    data['compare_price'] = comparePrice;
    data['rating'] = rating;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}

class HotProd {
  String store;
  String category;
  String name;
  String slug;
  String disc;
  String image;
  int price;
  int? comparePrice;
  int rating;
  String type;
  String status;

  HotProd({
    required this.store,
    required this.category,
    required this.name,
    required this.slug,
    required this.disc,
    required this.image,
    required this.price,
    this.comparePrice,
    required this.rating,
    required this.type,
    required this.status,
  });

  factory HotProd.fromJson(Map<String, dynamic> json) {
    return HotProd(
      store: json['store'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      disc: json['disc'] ?? '',
      image: json['image_url'] ?? '',
      price: json['price'] ?? 0,
      comparePrice: json['compare_price'],
      rating: json['rating'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store'] = store;
    data['category'] = category;
    data['name'] = name;
    data['slug'] = slug;
    data['disc'] = disc;
    data['image_url'] = image;
    data['price'] = price;
    data['compare_price'] = comparePrice;
    data['rating'] = rating;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}

class BestSellingProd {
  String store;
  String category;
  String name;
  String slug;
  String disc;
  String image;
  int price;
  int? comparePrice;
  int rating;
  String type;
  String status;

  BestSellingProd({
    required this.store,
    required this.category,
    required this.name,
    required this.slug,
    required this.disc,
    required this.image,
    required this.price,
    this.comparePrice,
    required this.rating,
    required this.type,
    required this.status,
  });

  factory BestSellingProd.fromJson(Map<String, dynamic> json) {
    return BestSellingProd(
      store: json['store'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      disc: json['disc'] ?? '',
      image: json['image_url'] ?? '',
      price: json['price'] ?? 0,
      comparePrice: json['compare_price'],
      rating: json['rating'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store'] = store;
    data['category'] = category;
    data['name'] = name;
    data['slug'] = slug;
    data['disc'] = disc;
    data['image'] = image;
    data['price'] = price;
    data['compare_price'] = comparePrice;
    data['rating'] = rating;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}
