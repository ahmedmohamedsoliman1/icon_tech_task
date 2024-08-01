import 'package:either_dart/either.dart';
import 'package:iconteck_task/feaures/category/data/model/categories_error_model.dart';
import 'package:iconteck_task/feaures/category/data/model/categories_model.dart';
import 'package:iconteck_task/feaures/category/data/model/products_model.dart';
import 'package:iconteck_task/feaures/category/domain/repository/categories_repo_impl.dart';

class CategoriesUseCase {

  CategoriesRepoImpl categoriesRepoImpl ;

  CategoriesUseCase ({required this.categoriesRepoImpl});

  Future<Either<CategoriesErrorModel, CategoriesModel>> getAllCategories({required String branchId}) async {
    return categoriesRepoImpl.getAllCategories(branchId: branchId);
  }

  Future<ProductsModel> getAllProducts({required String branchId, required String categoryId}) async {
    return categoriesRepoImpl.getAllProducts(branchId: branchId, categoryId: categoryId);
  }
}