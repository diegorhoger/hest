class ItemModel {
  final String name;
  final String category;
  final String description;
  final String image;
  final String currency;
  final double price;
  final String unit;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final bool isPopular;

  ItemModel({
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.currency,
    required this.price,
    required this.unit,
    required this.rating,
    required this.reviews,
    required this.isFavorite,
    required this.isPopular,
  });
}
