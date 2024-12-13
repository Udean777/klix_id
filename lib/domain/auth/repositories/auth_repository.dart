import 'package:dartz/dartz.dart';
import 'package:klix_id/data/auth/models/signin_req_params.dart';
import 'package:klix_id/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupReqParams params);
  Future<Either> signIn(SigninReqParams params);
  Future<bool> isLoggedIn();
}
