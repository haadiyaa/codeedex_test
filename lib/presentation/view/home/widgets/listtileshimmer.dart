
import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:codeedex_test/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        bottom: 30,
        left: 15,
        right: 15,
        top: 20,
      ),
      itemCount: 8,
      separatorBuilder: (BuildContext context, int index) {
        return Constants.height10;
      },
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: AppColors.green1.withOpacity(0.4),
          baseColor: AppColors.green1.withOpacity(0.6),
          child: Container(
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
            child: const ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              titleTextStyle: AppTextStyles.tile1,
              title: Text(
                'name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Cetegory: Tyre'),
            ),
          ),
        );
      },
    );
  }
}
