import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconteck_task/config/dependency_injection/DP.dart';
import 'package:iconteck_task/config/extensions/navigate_extension.dart';
import 'package:iconteck_task/core/app_routes.dart';
import 'package:iconteck_task/feaures/auth/presentation/screen/auth_navigator.dart';
import 'package:iconteck_task/feaures/auth/presentation/screen/auth_screen_view_model.dart';
import 'package:iconteck_task/widgets/app_button.dart';
import 'package:iconteck_task/widgets/app_indicator_loading.dart';
import 'package:iconteck_task/widgets/app_text.dart';
import 'package:iconteck_task/widgets/app_textFormField.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> implements AuthNavigator{

   AuthScreenViewModel viewModel = AuthScreenViewModel(authUseCase: DP.getIt());
  @override
  void initState() {
   viewModel.navigator =  this ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel ,
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.primaryColor,
                ) ,
                Positioned(
                  top: 80.h,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            appText(text: AppStrings.signIn,
                                color: AppColors.whiteColor,
                                fontSize: 20 ,
                            fontWeight: FontWeight.bold) ,
                            SizedBox(width: 5.w,),
                            const Icon(Icons.arrow_forward , color: AppColors.whiteColor, size: 30,) ,
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(20.h),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor ,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r) ,
                            topLeft: Radius.circular(20.r)
                          )
                        ),
                       child: SingleChildScrollView(
                         child: Form(
                           key: viewModel.formKey,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               SizedBox(height: 50.h,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   appText(text: AppStrings.letsLogin,
                                       color: AppColors.blackColor,
                                       fontSize: 22 ,
                                       fontWeight: FontWeight.bold),
                                 ],
                               ) ,
                               SizedBox(height: 40.w,),
                               appText(
                                   text: AppStrings.phone,
                                   color: AppColors.greyColor,
                                   fontSize: 16),
                               SizedBox(height: 10.w,),
                               appTextFormField(
                                 isNumberType: true,
                                   hint: "",
                                   icon: Icons.phone,
                                   onChanged: (input) {
                                     viewModel.equalPhone(input);
                                   },
                                   validator: (input) {
                                     if (input == null || input.trim().isEmpty){
                                       return AppStrings.phoneRequired;
                                     }else {
                                       return null ;
                                     }
                                   },
                                   color: AppColors.greyColor,
                                   controller: viewModel.phoneController) ,
                               SizedBox(height: 30.w,),
                               appText(
                                   text: AppStrings.password,
                                   color: AppColors.greyColor,
                                   fontSize: 16),
                               SizedBox(height: 10.w,),
                               appTextFormField(
                                 isIconPresses: () {
                                   viewModel.isObscure = ! viewModel.isObscure ;
                                   setState(() {

                                   });
                                 },
                                  obscure: viewModel.isObscure,
                                   hint: "",
                                   icon: viewModel.isObscure?
                                   Icons.visibility_off_rounded :
                                   Icons.visibility,
                                   onChanged: (input) {
                                    viewModel.equalPassword(input);
                                   },
                                   validator: (input) {
                                     if (input == null || input.trim().isEmpty){
                                       return AppStrings.passwordRequired;
                                     }else {
                                       return null ;
                                     }
                                   },
                                   color: AppColors.greyColor,
                                   controller: viewModel.passwordController) ,
                               SizedBox(height: 20.w,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   appText(text: AppStrings.forgetPassword,
                                       color: AppColors.blackColor, fontSize: 18 ,
                                   fontWeight: FontWeight.w500)
                                 ],
                               ),
                               SizedBox(height: 20.w,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Consumer<AuthScreenViewModel>(
                                       builder: (context , provider , _) {
                                         if (provider.isLoginLoading){
                                           return customButton(null, context,
                                               appIndicatorLoading(),
                                               AppColors.greyColor);
                                         }else {
                                           return customButton((){
                                               viewModel.auth(context: context);
                                           }, context,
                                               appText(text: AppStrings.signIn,
                                                   color: AppColors.whiteColor,
                                                   fontSize: 18 ,
                                               fontWeight: FontWeight.w700), AppColors.primaryColor);
                                         }
                                       }),
                                 ],
                               ),
                               SizedBox(height: 20.w,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   RichText(text: const TextSpan(
                                     children: [
                                       TextSpan(
                                         text: AppStrings.haveNoAccout ,
                                         style: TextStyle(
                                           color: AppColors.greyColor
                                             , fontSize: 18 ,
                                             fontWeight: FontWeight.w500
                                         )
                                       ) ,
                                       TextSpan(
                                           text: AppStrings.register ,
                                           style: TextStyle(
                                               color: AppColors.blackColor
                                               , fontSize: 18 ,
                                               fontWeight: FontWeight.w500
                                           )
                                       )
                                     ]
                                   )),
                                 ],
                               ) ,

                             ],
                           ),
                         ),
                       ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),);
  }

  @override
  void navigateToRestaurantBranches() {
    context.pushReplacement(context , AppRoutes.restaurantBranchesScreenRoute);
  }
}
