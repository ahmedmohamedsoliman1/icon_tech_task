import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconteck_task/config/dependency_injection/DP.dart';
import 'package:iconteck_task/core/app_strings.dart';
import 'package:iconteck_task/feaures/resturant_branches/presentation/screen/restuarant_navigator.dart';
import 'package:iconteck_task/feaures/resturant_branches/presentation/screen/resturant_branches_view_model.dart';
import 'package:iconteck_task/widgets/app_text.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';

class RestaurantBranchesScreen extends StatefulWidget {
  const RestaurantBranchesScreen({super.key});

  @override
  State<RestaurantBranchesScreen> createState() => _RestaurantBranchesScreenState();
}

class _RestaurantBranchesScreenState extends State<RestaurantBranchesScreen> implements RestaurantNavigator{

  RestaurantBranchesViewModel viewModel  = RestaurantBranchesViewModel(restaurantBranchesUseCase: DP.getIt());

  @override
  void initState() {
    viewModel.navigator = this ;
    loadData();
    super.initState();
  }

  void loadData () {
    viewModel.getRestaurantBranches(context);
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel ,
    child: SafeArea(
      child: Scaffold(
        body: Consumer<RestaurantBranchesViewModel>(
            builder: (context , provider , _) {
              if (viewModel.isAllRestaurantBranchesLoading){
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: viewModel.kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        viewModel.mainController.complete(controller);
                        viewModel.mapController = controller ;
                        setState(() {

                        });
                      },
                    ),
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width*0.7,
                        height: MediaQuery.of(context).size.height*0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ) ,
                            SizedBox(height: 10.h,),
                            appText(text: AppStrings.loading, color: AppColors.blackColor, fontSize: 18 ,
                            fontWeight: FontWeight.w500)
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }else {
                return Stack(
                  children: [
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: viewModel.markers,
                        initialCameraPosition: viewModel.kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          viewModel.mapController = controller ;
                          viewModel.customInfoWindowController.googleMapController = controller ;
                          setState(() {
                            for (int i = 0 ; i < viewModel.restaurantBranchesList!.length ; i++){
                              viewModel.mapController!.animateCamera(CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: LatLng(double.parse(viewModel.restaurantBranchesList!.map((e)=> e.lat).toList()[i]!),
                                      double.parse(viewModel.restaurantBranchesList!.map((e)=> e.long).toList()[i]!),))
                              ));
                            }
                          });
                        },
                        onTap: (position) {
                          viewModel.customInfoWindowController.hideInfoWindow!();
                        },
                        onCameraMove: (position) {
                          viewModel.customInfoWindowController.onCameraMove!();
                        },
                      ),
                    ),
                    CustomInfoWindow(
                        controller: viewModel.customInfoWindowController ,
                    height: MediaQuery.of(context).size.height*0.45,
                    width: MediaQuery.of(context).size.width,)
                  ],
                );
              }
            })
      ),
    ),);
  }
}
