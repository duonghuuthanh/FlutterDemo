class Book {
  int id;
  String name;
  int price;
  String image;
  String category;
  bool active;

  Book({required this.id, required this.name,
        required this.price, required this.image,
        required this.category, required this.active});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"],
        active: json["active"]);
  }
}