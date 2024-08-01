import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconteck_task/config/extensions/navigate_extension.dart';
import 'package:iconteck_task/core/app_colors.dart';

class DetailsStackWidgetThree extends StatefulWidget {
  const DetailsStackWidgetThree({Key? key}) : super(key: key);

  @override
  State<DetailsStackWidgetThree> createState() => _DetailsStackWidgetThreeState();
}

class _DetailsStackWidgetThreeState extends State<DetailsStackWidgetThree> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(10)
          ),
          child: const Icon(Icons.favorite_border , color: AppColors.whiteColor,),
        ),
        InkWell(
          onTap: () {
            context.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10)
            ),
            child: const Icon(Icons.arrow_forward_ios_sharp , color: AppColors.whiteColor,),
          ),
        ),
      ],
    );
  }
}
