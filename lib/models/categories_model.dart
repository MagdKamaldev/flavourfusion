class Item {
  int id;
  String name;
  int categoryId;
  String description;
  double price;
  String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['ID'],
      name: json['name'],
      categoryId: json['category_id'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      imageUrl: json['image_url'],
    );
  }
}

class Category {
  int id;
  String name;
  List<Item> items;

  Category({
    required this.id,
    required this.name,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var itemJsonList = json['items'] as List;
    List<Item> itemList = itemJsonList.map((i) => Item.fromJson(i)).toList();

    return Category(
      id: json['ID'],
      name: json['name'],
      items: itemList,
    );
  }
}
