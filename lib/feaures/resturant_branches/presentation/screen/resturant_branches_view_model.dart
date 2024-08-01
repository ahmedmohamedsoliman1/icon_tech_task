import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconteck_task/config/extensions/navigate_extension.dart';
import 'package:iconteck_task/config/prefs/prefs.dart';
import 'package:iconteck_task/config/prefs/prefs_keys.dart';
import 'package:iconteck_task/core/app_colors.dart';
import 'package:iconteck_task/core/app_routes.dart';
import 'package:iconteck_task/core/app_strings.dart';
import 'package:iconteck_task/feaures/resturant_branches/domain/use_cases/restaurant_branches_use_case.dart';
import 'package:iconteck_task/feaures/resturant_branches/presentation/screen/restuarant_navigator.dart';
import 'package:iconteck_task/feaures/resturant_branches/presentation/widget/info_window_widget.dart';
import 'package:iconteck_task/widgets/app_text.dart';

import '../../data/model/restaurant_branches_model.dart';

import 'dart:ui' as ui;

class RestaurantBranchesViewModel extends ChangeNotifier {
 late RestaurantNavigator navigator ;

 RestaurantBranchesUseCase restaurantBranchesUseCase ;
 List<AllRestaurantBranchesData>? restaurantBranchesList = [] ;
 List<String?> latList = [] ;
  List<String?> lngList = [] ;

  Set<Marker> markers = {} ;

 final Completer<GoogleMapController> mainController =
 Completer<GoogleMapController>();

 CameraPosition kGooglePlex = const CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
 );

 GoogleMapController? mapController ;

 CustomInfoWindowController customInfoWindowController = CustomInfoWindowController();

 bool isAllRestaurantBranchesLoading = false ;

 String branchId = "" ;

 RestaurantBranchesViewModel ({required this.restaurantBranchesUseCase});

 void getRestaurantBranches (BuildContext context) async{
  isAllRestaurantBranchesLoading = true ;
  notifyListeners();
  await restaurantBranchesUseCase.getRestaurantBranches().then((response) async {
   restaurantBranchesList = response.data ;
   latList = response.data!.map((e) => e.lat).toList();
   latList = response.data!.map((e) => e.long).toList();
   for (int i = 0 ; i < restaurantBranchesList!.length ; i++){
    final Uint8List markerIcon = await getBytesFromAsset('assets/images/location.png', 50);
    markers.add(
     Marker(markerId: MarkerId("marker${i+1}") ,
     onTap: () {
      print("tabed");
      customInfoWindowController.addInfoWindow!(
          InkWell(
           onTap: () async{
            await Prefs.preferences.setString(PrefsKey.branchId, response.data!.map((e)=> e.id).toList()[i]!.toString()).then((_) {
             print("saved branch id");
             context.pushNamed(context , AppRoutes.categoryRoute , null);
            });
           },
            child: InfoWindowWidget(
             image: response.data!.map((e)=> e.image).toList()[i]!,
             title: response.data!.map((e)=> e.title!.ar).toList()[i]!,
             address: response.data!.map((e)=> e.address!.ar).toList()[i]!,
             distance: "${response.data!.map((e)=> e.distance).toList()[i]! ~/1}",
             phone: response.data!.map((e)=> e.phone).toList()[i]!,
             status: response.data!.map((e)=> e.statusAr).toList()[i]!,
            ),
          ) ,
          LatLng(double.parse(response.data!.map((e)=> e.lat).toList()[i]!),
           double.parse(response.data!.map((e)=> e.long).toList()[i]!),)
     );
     },
     position: LatLng(double.parse(response.data!.map((e)=> e.lat).toList()[i]!),
      double.parse(response.data!.map((e)=> e.long).toList()[i]!),) ,
     icon: BitmapDescriptor.bytes(markerIcon) )
    );
   }
   isAllRestaurantBranchesLoading = false ;
   notifyListeners();
  });
 }

 Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
 }
}