import 'package:dartz/dartz.dart';
import 'package:klix_id/data/auth/models/signup_req_params.dart';
import 'package:klix_id/data/auth/sources/auth_api_service.dart';
import 'package:klix_id/domain/auth/repositories/auth_repository.dart';
import 'package:klix_id/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    return await sl<AuthApiService>().signUp(params);
  }
}
