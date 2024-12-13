// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:klix_id/core/usecase/usecase.dart';
import 'package:klix_id/data/auth/models/signin_req_params.dart';
import 'package:klix_id/domain/auth/repositories/auth_repository.dart';
import 'package:klix_id/service_locator.dart';

class SigninUsecase extends Usecase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}
