class SingleOrder {
  bool success;
  String msg;
  OrderData data;

  SingleOrder({
    required this.success,
    required this.msg,
    required this.data,
  });

  factory SingleOrder.fromJson(Map<String, dynamic> json) {
    return SingleOrder(
      success: json['success'],
      msg: json['msg'],
      data: OrderData.fromJson(json['data']),
    );
  }
}

class OrderData {
  int id;
  String totalPrice;
  String status;
  List<OrderItem> orderItems;
  Address address;

  OrderData({
    required this.id,
    required this.totalPrice,
    required this.status,
    required this.orderItems,
    required this.address,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    var orderItemsList = json['order_items'] as List;
    List<OrderItem> orderItems = orderItemsList.map((i) => OrderItem.fromJson(i)).toList();

    return OrderData(
      id: json['id'],
      totalPrice: json['total_price'],
      status: json['status'],
      orderItems: orderItems,
      address: Address.fromJson(json['addresse']),
    );
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
}
