import 'package:iconteck_task/config/network/dio_client.dart';
import 'package:iconteck_task/config/network/dio_constants.dart';
import 'package:iconteck_task/feaures/resturant_branches/data/model/restaurant_branches_model.dart';
import 'package:iconteck_task/feaures/resturant_branches/data/repository/restaurant_branches_repo.dart';

class RestaurantBranchesRepoImpl implements RestaurantBranchesRepo {

  DioClient dioClient ;

  RestaurantBranchesRepoImpl ({required this.dioClient});

  @override
  Future<RestaurantBranchesModel> getRestaurantBranches() async{
   var url = DioConstants.branches ;
   try {
     var response = await dioClient.get(url: url);
     return RestaurantBranchesModel.fromJson(response.data);
   }catch (e) {
     rethrow ;
   }
  }

}