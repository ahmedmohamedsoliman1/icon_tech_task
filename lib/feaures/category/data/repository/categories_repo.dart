import 'package:iconteck_task/feaures/category/data/model/categories_model.dart';
import 'package:iconteck_task/feaures/category/data/model/categories_error_model.dart';
import 'package:either_dart/either.dart';
import 'package:iconteck_task/feaures/category/data/model/products_model.dart';

abstract class CategoriesRepo {

  Future <Either <CategoriesErrorModel , CategoriesModel>> getAllCategories ({required String branchId}) ;
  Future <ProductsModel> getAllProducts ({required String branchId ,
  required String categoryId}) ;
}