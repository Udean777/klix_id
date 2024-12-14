import 'package:get_it/get_it.dart';
import 'package:klix_id/core/network/dio_client.dart';
import 'package:klix_id/data/auth/repositories/auth_repository_impl.dart';
import 'package:klix_id/data/auth/sources/auth_api_service.dart';
import 'package:klix_id/data/movie/repositories/movie_repository_impl.dart';
import 'package:klix_id/data/movie/sources/movie_api_service.dart';
import 'package:klix_id/domain/auth/repositories/auth_repository.dart';
import 'package:klix_id/domain/auth/usecases/is_logged_in.dart';
import 'package:klix_id/domain/auth/usecases/signin_usecase.dart';
import 'package:klix_id/domain/auth/usecases/signup_usecase.dart';
import 'package:klix_id/domain/movie/repositories/movie_repository.dart';
import 'package:klix_id/domain/movie/usecases/get_trending_movies_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // DIO
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
}
