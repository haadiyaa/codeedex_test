import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:codeedex_test/presentation/providers/functionsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filtershimmer.dart';

class FilterWidiget extends StatefulWidget {
  const FilterWidiget({
    super.key,
  });

  @override
  State<FilterWidiget> createState() => _FilterWidigetState();
}

class _FilterWidigetState extends State<FilterWidiget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Consumer<FunctionsProvider>(
        builder: (context, provider, child) {
          if (provider.filterOptions.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: provider.filterOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    provider.changeFilter(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: provider.selectedFilter !=
                              provider.filterOptions[index]
                          ? Border.all(
                              color: AppColors.green1.withOpacity(0.4),
                              width: 1.5,
                            )
                          : null,
                      color: provider.selectedFilter ==
                              provider.filterOptions[index]
                          ? AppColors.green1
                          : AppColors.green1.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text(
                        provider.filterOptions[index],
                        style: provider.selectedFilter ==
                                provider.filterOptions[index]
                            ? AppTextStyles.whiteText
                            : AppTextStyles.blackText,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const FilterShimmer();
        },
      ),
    );
  }
}
