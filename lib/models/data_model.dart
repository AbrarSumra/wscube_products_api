class ProductsModel {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  num rating;
  num stock;
  String brand;
  String category;
  String thumbnail;
  List<dynamic> images;

  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      discountPercentage: json["discountPercentage"],
      rating: json["rating"],
      stock: json["stock"],
      brand: json["brand"],
      category: json["category"],
      thumbnail: json["thumbnail"],
      images: json["images"],
    );
  }
}

class DataModel {
  int total;
  int skip;
  int limit;
  List<ProductsModel> products;

  DataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.products,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<ProductsModel> listProducts = [];

    for (Map<String, dynamic> eachMap in json["products"]) {
      var eachProduct = ProductsModel.fromJson(eachMap);
      listProducts.add(eachProduct);
    }

    return DataModel(
      total: json["total"],
      skip: json["total"],
      limit: json["total"],
      products: listProducts,
    );
  }
}
