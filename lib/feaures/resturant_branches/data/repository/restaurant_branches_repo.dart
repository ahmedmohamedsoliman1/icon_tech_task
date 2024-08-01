import '../model/restaurant_branches_model.dart';

abstract class RestaurantBranchesRepo {
  Future <RestaurantBranchesModel> getRestaurantBranches () ;
}