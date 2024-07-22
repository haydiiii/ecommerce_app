// Define your model class
import 'dart:developer';

class Carousel {
  final int id;
  final String image;

  Carousel({
    required this.id,
    required this.image,
  });

  factory Carousel.fromJson(Map<String, dynamic> json) {
    return Carousel(
      id: json['id'],
      image: json['image'],
    );
  }
}

// Example usage in main function or elsewhere
void main() {
  // Example JSON data
  var jsonData = [
    {
      "id": 1,
      "image":
          "https://estore.ammarelgendy.online/storage/carusels/Djefb8HiYttE3lEvRnhrzo8rMK3NmINpAYnqDb3o.png"
    },
    {
      "id": 2,
      "image":
          "https://estore.ammarelgendy.online/storage/carusels/PUVrkBnhXFUUL2UEA6RF84Cw1AOD5PkDpe45aLq8.png"
    },
    // Add more carousel items as needed
  ];

  // Convert JSON data to list of Carousel objects
  List<Carousel> carousels =
      jsonData.map((json) => Carousel.fromJson(json)).toList();

  // Example usage to print the image URLs
  for (var carousel in carousels) {
    log('Carousel ID: ${carousel.id}, Image URL: ${carousel.image}');
  }
}
