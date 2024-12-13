import 'package:dartz/dartz.dart';
import 'package:klix_id/data/auth/models/signin_req_params.dart';
import 'package:klix_id/data/auth/models/signup_req_params.dart';
import 'package:klix_id/data/auth/sources/auth_api_service.dart';
import 'package:klix_id/domain/auth/repositories/auth_repository.dart';
import 'package:klix_id/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    var data = await sl<AuthApiService>().signUp(params);
    return data.fold(
      (error) => Left(error),
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("key", data["user"]["token"]);

        return Right(data);
      },
    );
  }

  @override
  Future<Either> signIn(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signIn(params);
    return data.fold(
      (error) => Left(error),
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("key", data["user"]["token"]);

        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
