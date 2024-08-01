import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/config/dependency_injection/DP.dart';
import 'package:iconteck_task/config/prefs/prefs.dart';
import 'package:iconteck_task/config/prefs/prefs_keys.dart';
import 'package:iconteck_task/config/theming/app_theming.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/card_screen.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/category_screen.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/product_details_screen.dart';
import 'package:iconteck_task/feaures/resturant_branches/presentation/screen/restauran_branches_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app_routes.dart';
import 'feaures/auth/presentation/screen/auth_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DP.setup();
  Prefs.preferences = await SharedPreferences.getInstance() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true ,
        minTextAdapt: true,
       designSize: const Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Icon tech task',
        theme: AppTheming.lightTheme,
        locale: const Locale("ar"),
        initialRoute: Prefs.getData(key: PrefsKey.userToken) != null ?
        AppRoutes.restaurantBranchesScreenRoute : AppRoutes.authScreenRoute,
        routes: {
          AppRoutes.authScreenRoute : (context) => const AuthScreen() ,
          AppRoutes.restaurantBranchesScreenRoute : (context) => const RestaurantBranchesScreen() ,
          AppRoutes.categoryRoute : (context) => const CategoryScreen() ,
          AppRoutes.productDetailsRoute : (context) => const ProductDetailsScreen() ,
          AppRoutes.cardScreenRoute : (context) => const CardScreen() ,
        },
      ),
    );
  }
}
