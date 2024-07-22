class OnboardingModel {
  final String image;
  final String title;
  final String body;

  OnboardingModel(
      {required this.image, required this.title, required this.body});
}

List<OnboardingModel> pages = [
  OnboardingModel(
    image: 'assets/onBoarding1.png',
    title: 'Easy and Safe Payment',
    body: 'pay for the products you buy safely and easily',
  ),
  OnboardingModel(
      image: 'assets/onBoarding2.png',
      title: 'Find Favorite Items',
      body: 'find your favorite products that you want to buy easily'),
  OnboardingModel(
      image: 'assets/onBoarding3.png',
      title: 'Product Delivery',
      body: 'Your product is delivered to ypur home safely and securely'),
];
