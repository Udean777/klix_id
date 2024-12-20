import 'package:get_it/get_it.dart';
import 'package:klix_id/core/network/dio_client.dart';
import 'package:klix_id/data/auth/repositories/auth_repository_impl.dart';
import 'package:klix_id/data/auth/sources/auth_api_service.dart';
import 'package:klix_id/data/movie/repositories/movie_repository_impl.dart';
import 'package:klix_id/data/movie/sources/movie_api_service.dart';
import 'package:klix_id/data/tv/repositories/tv_repository_impl.dart';
import 'package:klix_id/data/tv/sources/tv_services.dart';
import 'package:klix_id/domain/auth/repositories/auth_repository.dart';
import 'package:klix_id/domain/auth/usecases/is_logged_in.dart';
import 'package:klix_id/domain/auth/usecases/signin_usecase.dart';
import 'package:klix_id/domain/auth/usecases/signup_usecase.dart';
import 'package:klix_id/domain/movie/repositories/movie_repository.dart';
import 'package:klix_id/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:klix_id/domain/tv/repositories/tv_repository.dart';
import 'package:klix_id/domain/tv/usecases/get_popular_tv_usecase.dart';
import 'package:klix_id/domain/tv/usecases/get_recommendations_tv_usecase.dart';
import 'package:klix_id/domain/tv/usecases/get_similar_tv_usecase.dart';
import 'package:klix_id/domain/tv/usecases/get_tv_keywords_usecase.dart';
import 'package:klix_id/domain/tv/usecases/search_tv_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // DIO
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());
  sl.registerSingleton<TvServices>(TvServicesImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  // Movie Usecases
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());

  // Tv Usecases
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetSimilarTvsUseCase>(GetSimilarTvsUseCase());
  sl.registerSingleton<GetRecommendationTvsUseCase>(
      GetRecommendationTvsUseCase());
  sl.registerSingleton<GetTvKeywordsUsecase>(GetTvKeywordsUsecase());
  sl.registerSingleton<SearchTVUseCase>(SearchTVUseCase());
}
