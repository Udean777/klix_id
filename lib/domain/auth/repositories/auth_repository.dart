import 'package:dartz/dartz.dart';
import 'package:klix_id/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupReqParams params);
}
