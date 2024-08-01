import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/config/prefs/prefs.dart';
import 'package:iconteck_task/config/prefs/prefs_keys.dart';
import 'package:iconteck_task/feaures/auth/domain/use_cases/auth_use_case.dart';
import 'package:iconteck_task/feaures/auth/presentation/screen/auth_navigator.dart';
import 'package:iconteck_task/widgets/app_dialog.dart';

import '../../../../core/app_colors.dart';
import '../../../../widgets/app_text.dart';

class AuthScreenViewModel extends ChangeNotifier {
  late AuthNavigator navigator ;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true ;

  AuthUseCase authUseCase ;

  AuthScreenViewModel({required this.authUseCase});

  var formKey = GlobalKey<FormState>();
  bool isLoginLoading = false ;


  void equalPhone (String input) {
    phoneController.text = input ;
    notifyListeners();
  }

  void equalPassword (String input) {
    passwordController.text = input ;
    notifyListeners();
  }

  void auth ({required BuildContext context}) async {
    if (formKey.currentState!.validate()){
      isLoginLoading = true ;
      notifyListeners();
      await authUseCase.authUseCase(
          phone: phoneController.text,
          password: passwordController.text).then((response) {
            if (response.isRight){
              isLoginLoading = false ;
              notifyListeners();
              Prefs.saveData(key: PrefsKey.userToken, value: response.right.data!.accessToken!).then((_) {
                print("token saved");
              });
              navigator.navigateToRestaurantBranches();
            }else {
              isLoginLoading = false ;
              notifyListeners();
              AppDialog.showAppDialog(
                  content: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    content: Padding(padding: EdgeInsets.all(20.w) ,
                      child: SizedBox(
                        width: 80.w,
                        height: 100.h,
                        child: Column(
                          children: [
                            const Icon(Icons.error , color: AppColors.redColor, size: 40,) ,
                            SizedBox(height: 15.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: appText(text: response.left.msg!,
                                      color: AppColors.primaryColor, fontSize: 16 ,
                                      fontWeight: FontWeight.w700 ,
                                      textAlight: TextAlign.center),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                  backGroundColor: AppColors.whiteColor,
                  context: context);
            }
      });
    }
  }

}