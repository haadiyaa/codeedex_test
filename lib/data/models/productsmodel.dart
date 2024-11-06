import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>  List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListProductsModel {
  List<ProductsModel> data;

    ListProductsModel({
        required this.data,
    });

    factory ListProductsModel.fromJson(List<dynamic> json) => ListProductsModel(
        data: json.map((map) => ProductsModel.fromJson(map)).toList(),
    );

}

class ProductsModel {
    int id;
    int partsCat;
    String partImage;
    int vBrand;
    int vCategory;
    String price;
    String? partsName;
    String description;
     String? offerPrice;
    bool isOffer;
    String productRating;

    ProductsModel({
        required this.id,
        required this.partsCat,
        required this.partImage,
        required this.vBrand,
        required this.vCategory,
        required this.price,
        this.partsName,
        required this.description,
        this.offerPrice,
        required this.isOffer,
        required this.productRating,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        partsCat: json["parts_Cat"],
        partImage: json["part_image"],
        vBrand: json["v_brand"],
        vCategory: json["v_category"],
        price: json["price"],
        partsName: json["parts_name"]??'',
        description: json["description"],
        offerPrice: json["offer_price"]??'',
        isOffer: json["is_offer"],
        productRating: json["product_rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parts_Cat": partsCat,
        "part_image": partImage,
        "v_brand": vBrand,
        "v_category": vCategory,
        "price": price,
        "parts_name": partsName,
        "description": description,
        "offer_price": offerPrice,
        "is_offer": isOffer,
        "product_rating": productRating,
    };
}
