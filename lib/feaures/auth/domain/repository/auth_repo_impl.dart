import 'package:either_dart/src/either.dart';
import 'package:iconteck_task/config/network/dio_client.dart';
import 'package:iconteck_task/config/network/dio_constants.dart';
import 'package:iconteck_task/feaures/auth/data/model/auth_error_model.dart';
import 'package:iconteck_task/feaures/auth/data/model/auth_model.dart';
import 'package:iconteck_task/feaures/auth/data/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {

  DioClient dioClient ;
  AuthRepoImpl ({required this.dioClient});

  @override
  Future<Either<AuthErrorModel, AuthModel>> auth({required String phone, required String password}) async{
    var url = DioConstants.auth;
    try {
      var response = await dioClient.post(url: url, body: {
        "phone" : phone,
        "password" : password,
        "company_id" : 3
      } ,
      isFormData: true);
      if (response.statusCode == 200){
        return Right(AuthModel.fromJson(response.data));
      }else {
        return Left(AuthErrorModel.fromJson(response.data));
      }
    }catch (e){
      rethrow ;
    }
  }

}