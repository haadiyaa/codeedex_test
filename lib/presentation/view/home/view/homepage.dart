import 'package:codeedex_test/core/constants.dart';
import 'package:codeedex_test/presentation/providers/functionsprovider.dart';
import 'package:codeedex_test/presentation/view/home/widgets/customdialog.dart';
import 'package:codeedex_test/presentation/view/home/widgets/customlisttile.dart';
import 'package:codeedex_test/presentation/view/home/widgets/filterwidgets.dart';
import 'package:codeedex_test/presentation/view/home/widgets/listtileshimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Constants.height10,
          const FilterWidiget(),
          Expanded(
            child: Consumer<FunctionsProvider>(
              builder: (context, provider, child) {
                if (provider.categoriesModel != null &&
                    provider.productsModel != null) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(
                      bottom: 30,
                      left: 15,
                      right: 15,
                      top: 20,
                    ),
                    itemCount: provider.productsModel!.data.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Constants.height10;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(
                                model: provider.productsModel!,
                                index: index,
                              );
                            },
                          );
                        },
                        child: CustomListTile(
                          index: index,
                          model: provider.productsModel!,
                        ),
                      );
                    },
                  );
                }
                return const ListTileShimmer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
