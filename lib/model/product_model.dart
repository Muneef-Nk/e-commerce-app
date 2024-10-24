class ProductModel {
  final int productId;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String brand;
  final double rating;
  final String imageUrl;

  ProductModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.brand,
    required this.rating,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      brand: json['brand'],
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['image'] ?? 'https://via.placeholder.com/150',
    );
  }
}
