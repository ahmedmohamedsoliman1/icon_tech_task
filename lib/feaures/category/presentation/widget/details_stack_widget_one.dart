import 'package:flutter/cupertino.dart';
import 'package:iconteck_task/core/app_colors.dart';

class DetailsStackWidgetOne extends StatefulWidget {
  const DetailsStackWidgetOne({Key? key}) : super(key: key);

  @override
  State<DetailsStackWidgetOne> createState() => _DetailsStackWidgetOneState();
}

class _DetailsStackWidgetOneState extends State<DetailsStackWidgetOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.primaryColor,
    );
  }
}
