import 'package:codeedex_test/core/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FilterShimmer extends StatelessWidget {
  const FilterShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: AppColors.green1.withOpacity(0.4),
          baseColor: AppColors.green1.withOpacity(0.6),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: AppColors.green1,
            ),
            child: const Center(
              child: Text('data'),
            ),
          ),
        );
      },
    );
  }
}
