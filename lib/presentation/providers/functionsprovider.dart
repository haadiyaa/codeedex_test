import 'dart:convert';

import 'package:codeedex_test/data/models/categoriesmodel.dart';
import 'package:codeedex_test/data/models/productsmodel.dart';
import 'package:codeedex_test/data/repositories/apirepositories.dart';
import 'package:flutter/material.dart';

class FunctionsProvider extends ChangeNotifier {
  bool isPasswordvisible = false;
  ListProductsModel? productsModel;
  ListCategoriesModel? categoriesModel;

  String selectedFilter = '';
  String category = '';
  List<String> filterOptions = [];

  void togglePassword() {
    isPasswordvisible = !isPasswordvisible;
    notifyListeners();
  }

  void changeFilter(int index) {
    selectedFilter = filterOptions[index];
    notifyListeners();
  }

  void getCategory(int index) {
    category=categoriesModel!.data.where(
      (element) {
        return element.id == productsModel!.data[index].vCategory;
      },
    ).toString();
  }

  void getProducts() async {
    try {
      await ApiRepository().getProducts().then(
        (response) {
          final data = jsonDecode(response.body);
          print('products $data');
          if (response.statusCode == 200) {
            productsModel = ListProductsModel.fromJson(data);
            print('prod success');
          } else {
            print('prod error');
          }
        },
      );
    } catch (e) {
      print('prod ${e.toString()}');
    } finally {
      notifyListeners();
    }
  }

  void getCategories() async {
    try {
      await ApiRepository().getCategory().then(
        (response) {
          final data = jsonDecode(response.body);
          print('cat $data');
          if (response.statusCode == 200) {
            categoriesModel = ListCategoriesModel.fromJson(data);
            selectedFilter = categoriesModel!.data[0].catName;
            for (var element in categoriesModel!.data) {
              filterOptions.add(element.catName);
            }
            print(filterOptions);
            // categoriesModel.forEach()
          } else {
            print('cat error');
          }
        },
      );
    } catch (e) {
      print('cat ${e.toString()}');
    } finally {
      notifyListeners();
    }
  }
}
