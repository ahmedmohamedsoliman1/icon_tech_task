import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/config/dependency_injection/DP.dart';
import 'package:iconteck_task/config/prefs/prefs.dart';
import 'package:iconteck_task/config/prefs/prefs_keys.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/category_screen_view_model.dart';
import 'package:iconteck_task/feaures/category/presentation/widget/card_item_widget.dart';
import 'package:iconteck_task/feaures/category/presentation/widget/order_report_widget.dart';
import 'package:iconteck_task/widgets/app_app_bar.dart';
import 'package:iconteck_task/widgets/app_empty_state.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CategoryScreenViewModel(categoriesUseCase: DP.getIt()) ,
    child: Scaffold(
      appBar: customAppBar("سلتى", context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Consumer<CategoryScreenViewModel>(
              builder: (context , provider , _) {
                if (provider.retrieveCardList() == null){
                  return const Center(child: EmptyState(title: "السلة فارغه", subTitle: "السلة فارغه بأمكانك اختيار منتجات"),);
                }else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                            itemBuilder: (context , index) {
                              return CardItemWidget(
                                price: provider.retrieveCardList()![index].price!,
                                title: provider.retrieveCardList()![index].title!,
                                image: provider.retrieveCardList()![index].image!,
                                quantity: provider.retrieveCardList()![index].quantity!,
                                onPressed: () async{
                                  provider.retrieveCardList()!.removeAt(index);
                                  print(provider.retrieveCardList()!.removeAt(index));
                                 setState(() {
                                  print("removed");
                                 });
                                  await Prefs.preferences.setStringList(PrefsKey.cardList, provider.retrieveCardList()!.map((item) => jsonEncode(item.toJson())).toList()).then((_) {
                                    print("${Prefs.preferences.getStringList(PrefsKey.cardList)}");
                                  });
                                },
                              );
                            },
                            separatorBuilder: (context , index) {
                              return SizedBox(height: 20.h,);
                            },
                            itemCount: provider.retrieveCardList()!.length ,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.45,)
                      ],
                    ),
                  );
                }
              }),
          Consumer<CategoryScreenViewModel>(
              builder: (context , provider , _) {
                if (provider.retrieveCardList() == null){
                  return const SizedBox();
                }else {
                  return Positioned(
                    bottom: 0,
                    child: OrderReportWidget(numberOfProducts: provider.retrieveCardList()!.length,
                    sum: provider.getPricesSum(),),
                  );
                }
              })
        ],
      ),
    ),);
  }
}
