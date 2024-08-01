import 'package:iconteck_task/feaures/auth/data/model/auth_error_model.dart';
import 'package:iconteck_task/feaures/auth/data/model/auth_model.dart';
import 'package:either_dart/either.dart';

abstract class AuthRepo {

  Future <Either <AuthErrorModel , AuthModel>> auth ({required String phone , required String password});
}