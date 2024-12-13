import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:klix_id/core/constants/api_url.dart';
import 'package:klix_id/core/network/dio_client.dart';
import 'package:klix_id/data/auth/models/signup_req_params.dart';
import 'package:klix_id/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignupReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signUp(SignupReqParams params) async {
    try {
      var res = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }
}
