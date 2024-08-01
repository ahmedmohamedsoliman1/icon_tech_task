import 'package:either_dart/src/either.dart';
import 'package:iconteck_task/config/network/dio_client.dart';
import 'package:iconteck_task/feaures/category/data/model/categories_error_model.dart';
import 'package:iconteck_task/feaures/category/data/model/categories_model.dart';
import 'package:iconteck_task/feaures/category/data/model/products_model.dart';
import 'package:iconteck_task/feaures/category/data/repository/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {

  DioClient dioClient ;

  CategoriesRepoImpl ({required this.dioClient});

  @override
  Future<Either<CategoriesErrorModel, CategoriesModel>> getAllCategories({required String branchId}) async{
    var url = "https://nottr.app/api/branch/$branchId/categories";
    try {
      var response = await dioClient.get(url: url);
      if (response.statusCode == 200){
        return Right(CategoriesModel.fromJson(response.data));
      }else {
        return Left(CategoriesErrorModel.fromJson(response.data));
      }
    }catch (e) {
      rethrow ;
    }
  }

  @override
  Future<ProductsModel> getAllProducts({required String branchId, required String categoryId}) async{
   var url = "https://nottr.app/api/branch/$branchId/category/$categoryId/products?paginate=10&page=1";
   try {
     var response = await dioClient.get(url: url);
     return ProductsModel.fromJson(response.data);
   }catch (e) {
     rethrow ;
   }
  }

}