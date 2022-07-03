class Product {
  String id;
  String storeName;
  String name;
  String image;
  String description;
  double price;
  double priceAfterReduction;

  Product({
    required this.name,
    required this.id,
    required this.storeName,
    required this.image,
    required this.description,
    required this.price,
    required this.priceAfterReduction,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      storeName: json["storeName"],
      name: json["name"],
      image: json["image"],
      description: json["description"],
      price: json["price"],
      priceAfterReduction: json["priceAfterReduction"],
    );
  }
// from object to json
  Map<String, dynamic> Tojson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "description": description,
      "price": price,
      "priceAfterReduction": priceAfterReduction,
    };
  }
}
