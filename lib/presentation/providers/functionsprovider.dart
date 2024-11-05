import 'dart:convert';

import 'package:codeedex_test/data/models/categoriesmodel.dart';
import 'package:codeedex_test/data/models/productsmodel.dart';
import 'package:codeedex_test/data/repositories/apirepositories.dart';
import 'package:flutter/material.dart';

class FunctionsProvider extends ChangeNotifier {
  bool isPasswordvisible = false;
  ProductsModel? productsModel;
  CategoriesModel? categoriesModel;

  void togglePassword() {
    isPasswordvisible = !isPasswordvisible;
    notifyListeners();
  }

  void getProducts() async {
    try {
      await ApiRepository().getProducts().then(
        (response) {
          final data = jsonDecode(response.body);
          print('products $data');
          if (response.statusCode == 200) {
            productsModel = ProductsModel.fromJson(data);
          } else {}
        },
      );
    } catch (e) {}
  }

  void getCategories() async {
    try {
      await ApiRepository().getCategory().then(
        (response) {
          final data = jsonDecode(response.body);
          print('cat $data');
          if (response.statusCode == 200) {
            categoriesModel = CategoriesModel.fromJson(data);
          } else {}
        },
      );
    } catch (e) {}
  }
}
