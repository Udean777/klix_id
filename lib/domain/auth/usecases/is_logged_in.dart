// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:klix_id/core/usecase/usecase.dart';
import 'package:klix_id/domain/auth/repositories/auth_repository.dart';
import 'package:klix_id/service_locator.dart';

class IsLoggedInUseCase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
