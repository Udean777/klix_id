import 'package:get_it/get_it.dart';
import 'package:klix_id/core/network/dio_client.dart';
import 'package:klix_id/data/auth/repositories/auth_repository_impl.dart';
import 'package:klix_id/data/auth/sources/auth_api_service.dart';
import 'package:klix_id/domain/auth/repositories/auth_repository.dart';
import 'package:klix_id/domain/auth/usecases/signup_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
}
