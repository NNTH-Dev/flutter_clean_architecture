class ProductEntity {
  final int? id;
  final String? name;
  final String? price;
  final String? imageUrl;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
  });
}
