class OrdersResponse {
  bool success;
  String msg;
  List<Order> data;

  OrdersResponse({
    required this.success,
    required this.msg,
    required this.data,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      success: json['success'],
      msg: json['msg'],
      data: List<Order>.from(json['data'].map((x) => Order.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'msg': msg,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Order {
  int id;
  String totalPrice;
  String status;
  List<OrderItem> orderItems;
  Address addresse;

  Order({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.orderItems,
    required this.addresse,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      totalPrice: json['total_price'],
      status: json['status'],
      orderItems: List<OrderItem>.from(
          json['order_items'].map((x) => OrderItem.fromJson(x))),
      addresse: Address.fromJson(json['addresse']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_price': totalPrice,
      'status': status,
      'order_items':
          List<dynamic>.from(orderItems.map((x) => x.toJson())),
      'addresse': addresse.toJson(),
    };
  }
}

class OrderItem {
  int id;
  int orderId;
  int productId;
  int quantity;
  String totalPrice;
  Product product;

  OrderItem({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.totalPrice,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
      product: Product.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'product_id': productId,
      'quantity': quantity,
      'total_price': totalPrice,
      'product': product.toJson(),
    };
  }
}

class Product {
  int id;
  String name;
  String slug;
  int price;
  String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      price: json['price'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'price': price,
      'image_url': imageUrl,
    };
  }
}

class Address {
  int id;
  int orderId;
  String firstName;
  String lastName;
  String phone;
  String address;
  String country;

  Address({
    required this.id,
    required this.orderId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      orderId: json['order_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      address: json['address'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
      'country': country,
    };
  }
}
