import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iconteck_task/feaures/auth/domain/repository/auth_repo_impl.dart';
import 'package:iconteck_task/feaures/auth/domain/use_cases/auth_use_case.dart';
import 'package:iconteck_task/feaures/auth/presentation/screen/auth_screen_view_model.dart';
import 'package:iconteck_task/feaures/category/domain/repository/categories_repo_impl.dart';
import 'package:iconteck_task/feaures/category/domain/use_cases/categories_use_case.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/category_screen_view_model.dart';
import 'package:iconteck_task/feaures/resturant_branches/domain/repository/restaurant_branches_repo_impl.dart';
import 'package:iconteck_task/feaures/resturant_branches/domain/use_cases/restaurant_branches_use_case.dart';
import 'package:iconteck_task/feaures/resturant_branches/presentation/screen/resturant_branches_view_model.dart';

import '../network/dio_client.dart';

class DP {

  static GetIt getIt = GetIt.instance ;

  static void setup () {
    Dio dio = Dio();
    getIt.registerLazySingleton<DioClient>(() => DioClient(dio: dio));
    getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(dioClient: getIt()));
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(authRepoImpl: getIt()));
    getIt.registerLazySingleton<AuthScreenViewModel>(() => AuthScreenViewModel(authUseCase: getIt()));
    getIt.registerLazySingleton<RestaurantBranchesRepoImpl>(() => RestaurantBranchesRepoImpl(dioClient: getIt()));
    getIt.registerLazySingleton<RestaurantBranchesUseCase>(() => RestaurantBranchesUseCase(restaurantBranchesRepoImpl: getIt()));
    getIt.registerLazySingleton<RestaurantBranchesViewModel>(() => RestaurantBranchesViewModel(restaurantBranchesUseCase: getIt()));
    getIt.registerLazySingleton<CategoriesRepoImpl>(() => CategoriesRepoImpl (dioClient: getIt()));
    getIt.registerLazySingleton<CategoriesUseCase>(() => CategoriesUseCase(categoriesRepoImpl: getIt()));
    getIt.registerLazySingleton<CategoryScreenViewModel>(() => CategoryScreenViewModel(categoriesUseCase: getIt()));
  }
}