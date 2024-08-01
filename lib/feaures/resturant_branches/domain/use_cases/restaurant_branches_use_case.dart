import 'package:iconteck_task/feaures/resturant_branches/domain/repository/restaurant_branches_repo_impl.dart';

import '../../data/model/restaurant_branches_model.dart';

class RestaurantBranchesUseCase {
  RestaurantBranchesRepoImpl restaurantBranchesRepoImpl ;
  RestaurantBranchesUseCase ({required this.restaurantBranchesRepoImpl});

  Future<RestaurantBranchesModel> getRestaurantBranches() async {
    return restaurantBranchesRepoImpl.getRestaurantBranches();
  }
}