import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/config/dependency_injection/DP.dart';
import 'package:iconteck_task/config/extensions/navigate_extension.dart';
import 'package:iconteck_task/config/prefs/prefs.dart';
import 'package:iconteck_task/config/prefs/prefs_keys.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/core/app_images.dart';
import 'package:iconteck_task/core/app_routes.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/category_navigator.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/category_screen_view_model.dart';
import 'package:iconteck_task/widgets/app_app_bar.dart';
import 'package:iconteck_task/widgets/app_shimmer.dart';
import 'package:iconteck_task/widgets/app_text.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> implements CategoryNavigator{

  CategoryScreenViewModel viewModel = CategoryScreenViewModel (categoriesUseCase: DP.getIt()) ;

  @override
  void initState() {
    viewModel.navigator = this ;
    loadData();
    super.initState();
  }

  void loadData () {
    viewModel.getAllCategories(branchId: Prefs.preferences.getString(PrefsKey.branchId)!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel ,
    child: Consumer<CategoryScreenViewModel>(builder: (context , provider, _) {
      return Scaffold(
        appBar: customAppBar(viewModel.appBarTitle, context),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<CategoryScreenViewModel>(
                    builder: (context , provider , _) {
                      if (provider.isCategoriesDataLoading){
                        return AppShimmer(
                            shimmerWidget: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60.h,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context , index) {
                                    return Container(
                                      width: 60.w,
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.blackColor,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context , index) {
                                    return SizedBox(width: 8.w,);
                                  },
                                  itemCount: 10),
                            ));
                      }else if (provider.isErrorData){
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: const AssetImage(AppImages.closed) ,
                                  width: 300.w,
                                  height: 300.h,
                                  fit: BoxFit.fill,),
                                SizedBox(height: 10.h,),
                                appText(
                                    text: provider.errorMessage,
                                    color: AppColors.blackColor, fontSize: 16 ,
                                    fontWeight: FontWeight.w600)
                              ],
                            ),
                          ),
                        );
                      }else {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context , index) {
                                return InkWell(
                                  onTap: () {
                                    viewModel.equalAppBarTitle(index);
                                    viewModel.equalSelectedCategory(index);
                                    setState(() {

                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    color: provider.selectedCategory == index ?
                                    AppColors.primaryColor : AppColors.whiteColor,
                                    elevation: 3,
                                    child: Center(
                                      child: Image(image: NetworkImage(provider.categoriesList![index].image!)),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context , index) {
                                return SizedBox(width: 15.w,);
                              },
                              itemCount: provider.categoriesList!.length),
                        );
                      }
                    }),
                SizedBox(height: 30.h,),
                Consumer<CategoryScreenViewModel>(
                    builder: (context , provider , _) {
                      if (provider.isProductsDataLoading){
                        return AppShimmer(
                            shimmerWidget: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2 ,
                                crossAxisSpacing: 10 ,
                                mainAxisSpacing: 10 ,
                                childAspectRatio: 0.6),
                                itemBuilder: (context , index) {
                                  return Container(
                                    width: 200.w,
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.blackColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  );
                                },
                                itemCount: 10));
                      }else {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2 ,
                            mainAxisSpacing: 10 ,
                            crossAxisSpacing: 10 ,
                            childAspectRatio: 0.6),
                            itemBuilder: (context , index) {
                              return InkWell(
                                onTap: () {
                                  context.pushNamed(context , AppRoutes.productDetailsRoute , {
                                    "image" : provider.productsList![index].images![0].image! ,
                                    "title" : provider.productsList![index].title!.ar,
                                    "calories" : provider.productsList![index].calories ,
                                    "price" : provider.productsList![index].customerPrice
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      elevation: 3,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  appText(
                                                      text: provider.productsList![index].title!.ar!,
                                                      color: AppColors.primaryColor, fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                                ],
                                              ),
                                              appText(
                                                  text: provider.productsList![index].description!.ar!,
                                                  color: AppColors.greyColor, fontSize: 18,
                                                  fontWeight: FontWeight.bold ,
                                              textAlight: TextAlign.end),
                                               SizedBox(height: 10.h,),
                                              const Row(
                                                children: [
                                                  Icon(Icons.favorite_border)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),),
                                    Image(image: NetworkImage(provider.productsList![index].images![0].image!),
                                    width: 100, height: 100,
                                    fit: BoxFit.fill,)
                                  ],
                                ),
                              );
                            },
                            itemCount: provider.productsList!.length);
                      }
                    }),

              ],
            ),
          ),
        ),
      );
    }),);
  }
}
