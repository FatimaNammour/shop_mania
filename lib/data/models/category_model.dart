import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  List<String> products;
  String id;
  String name;
  String slug;

  Category({
    required this.products,
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        products: List<String>.from(json["products"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x)),
        "_id": id,
        "name": name,
        "slug": slug,
      };

  static List<Category> fromList(List list) =>
      List<Category>.from(list.map((x) => Category.fromJson(x)));

  @override
  String toString() {
    return """CategoryName: $name ---------------------------,
    CategorySlug: $slug -----------------------------,
     CategoryId: $id -----------------------,
     CategoryProducts: ${products.first} -----------------------,
     
     """;
  }
}
