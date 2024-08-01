import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:iconteck_task/config/prefs/prefs.dart';
import 'package:iconteck_task/config/prefs/prefs_keys.dart';
import 'package:iconteck_task/feaures/category/data/model/categories_model.dart';
import 'package:iconteck_task/feaures/category/data/model/product_card_model.dart';
import 'package:iconteck_task/feaures/category/data/model/products_model.dart';
import 'package:iconteck_task/feaures/category/domain/use_cases/categories_use_case.dart';
import 'package:iconteck_task/feaures/category/presentation/screen/category_navigator.dart';

class CategoryScreenViewModel extends ChangeNotifier {
  late CategoryNavigator navigator ;

  bool isCategoriesDataLoading = false ;

  CategoriesUseCase categoriesUseCase ;

  List<AllCategoriesData>? categoriesList = [];
  List<AllProductsData>? productsList = [] ;

  bool isErrorData = false ;

  CategoryScreenViewModel ({required this.categoriesUseCase});

  String appBarTitle = "" ;
  String errorMessage = "" ;

  int selectedCategory = 0 ;

  bool isProductsDataLoading = false ;

  int number = 1 ;

  List<ProductCardModel> cardList = [] ;

  void getAllCategories ({required String branchId}) async{
    isCategoriesDataLoading = true ;
    notifyListeners();
    await categoriesUseCase.getAllCategories(branchId: branchId).then((response) {
      if (response.isRight){
        isCategoriesDataLoading = false ;
        categoriesList = response.right.data ;
        appBarTitle = categoriesList![selectedCategory].title!.ar! ;
        getAllProducts();
        notifyListeners();
      }else {
        isCategoriesDataLoading = false ;
        isErrorData = true ;
        errorMessage = response.left.msg! ;
        notifyListeners();
      }
    });
  }


  void equalAppBarTitle (int index) {
    appBarTitle = categoriesList![index].title!.ar! ;
    notifyListeners();
  }

  void equalSelectedCategory (int index) {
    selectedCategory = index ;
    getAllProducts();
    notifyListeners();
  }

  void getAllProducts () async {
     isProductsDataLoading = true ;
     notifyListeners();
     await categoriesUseCase.getAllProducts(
       branchId: Prefs.preferences.getString(PrefsKey.branchId)!,
       categoryId: categoriesList![selectedCategory].id!.toString()).then((response) {
      isProductsDataLoading = false ;
       productsList =  response.data!.data ;
      print("lenght is : ${productsList!.length}");
       notifyListeners();
   });
  }

  void increaseNumber () {
    number ++ ;
    notifyListeners();
  }

  void decreaseNumber () {
   if (number > 1){
     number -- ;
   }
   notifyListeners();
  }


  void addToCard ({required String title , required String image , required int price , required int quantity}) async{
    cardList.add(ProductCardModel(
        title:  title,
        image:  image,
        price:  price,
        quantity: quantity));
    await Prefs.preferences.setStringList(PrefsKey.cardList,  cardList.map((item) => jsonEncode(item.toJson())).toList()).then((_) {
      print("${Prefs.preferences.getStringList(PrefsKey.cardList)}");
    });
    notifyListeners();
  }


  List<ProductCardModel>? retrieveCardList () {
    List<String>? cardListString = Prefs.preferences.getStringList(PrefsKey.cardList);
    if (cardListString != null) {
      return cardListString.map((jsonString) => ProductCardModel.fromJson(jsonDecode(jsonString))).toList();
    }
    return null;
  }


  double getPricesSum () {
    int sum = 0 ;
    for (int i = 0 ; i < retrieveCardList()!.length ; i++){
      sum += retrieveCardList()![i].price!.toInt() ;
    }
    return sum + 1.43 ;
  }

 }