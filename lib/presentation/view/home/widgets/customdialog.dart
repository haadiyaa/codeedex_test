import 'package:codeedex_test/core/appclass.dart';
import 'package:codeedex_test/core/appcolors.dart';
import 'package:codeedex_test/core/apptextstyles.dart';
import 'package:codeedex_test/core/constants.dart';
import 'package:codeedex_test/data/models/productsmodel.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.model,
    required this.index,
  });
  final ListProductsModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            model.data[index].description,
            style: AppTextStyles.dialogHead,
          ),
          Constants.height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppClass().getHeight(context) * 0.4,
                width: AppClass().getWidth(context) * 0.6,
                child: Image(
                  image: NetworkImage(model.data[index].partImage),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Constants.height10,
          Text(
            'Price: ${model.data[index].price}',
            style: AppTextStyles.dialogDesc,
          ),
          Text(
            'Rating: ${model.data[index].productRating}',
            style: AppTextStyles.dialogDesc,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green1,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
