
import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:codeedex_test/data/models/productsmodel.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.model,
    required this.index,
  });
  final ListProductsModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(5, 5),
            color: Color.fromARGB(255, 192, 192, 192),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.green2,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        titleTextStyle: AppTextStyles.tile1,
        title: Text(
          model.data[index].description,
          style: const TextStyle(fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('Price: ${model.data[index].price}/-'),
      ),
    );
  }
}
