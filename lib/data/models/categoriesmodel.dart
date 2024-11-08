import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) => List<CategoriesModel>.from(json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListCategoriesModel {
  List<CategoriesModel> data;

    ListCategoriesModel({
        required this.data,
    });

    factory ListCategoriesModel.fromJson(List<dynamic> json) => ListCategoriesModel(
        data: json.map((map) => CategoriesModel.fromJson(map)).toList(),
    );

}

class CategoriesModel {
    int id;
    String catName;

    CategoriesModel({
        required this.id,
        required this.catName,
    });

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json["id"],
        catName: json["Cat_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Cat_name": catName,
    };
}
