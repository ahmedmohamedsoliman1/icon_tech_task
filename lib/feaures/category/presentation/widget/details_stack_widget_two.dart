import 'package:flutter/cupertino.dart';
import 'package:iconteck_task/core/app_colors.dart';

class DetailsStackWidgetTwo extends StatefulWidget {
  const DetailsStackWidgetTwo({Key? key}) : super(key: key);

  @override
  State<DetailsStackWidgetTwo> createState() => _DetailsStackWidgetTwoState();
}

class _DetailsStackWidgetTwoState extends State<DetailsStackWidgetTwo> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            color: AppColors.transparentColor,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.7,
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80) ,
                    topRight: Radius.circular(80))
            ),
          ),
        ],
      ),
    );
  }
}
