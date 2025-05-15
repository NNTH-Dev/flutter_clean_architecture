class ProductModel {
  int? id;
  String? name;
  int? price;
  String? imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'] ?? '';
      name = json['name'] ?? '';
      price = json['price'] ?? '';
      imageUrl = json['imageUrl'] ?? '';
    }
  }
}
