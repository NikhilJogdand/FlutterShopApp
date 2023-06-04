class Product {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final double price;
  bool isFavorite;

  Product(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.price,
      this.isFavorite = false});
}
