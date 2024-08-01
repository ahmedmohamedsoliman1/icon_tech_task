
import 'package:either_dart/either.dart';
import 'package:iconteck_task/feaures/auth/domain/repository/auth_repo_impl.dart';

import '../../data/model/auth_error_model.dart';
import '../../data/model/auth_model.dart';

class AuthUseCase {
  AuthRepoImpl authRepoImpl ;
  AuthUseCase ({required this.authRepoImpl});

  Future <Either <AuthErrorModel , AuthModel>> authUseCase ({required String phone , required String password}) {
    return authRepoImpl.auth(phone: phone, password: password) ;
  }
}