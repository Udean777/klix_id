import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:klix_id/core/constants/api_url.dart';
import 'package:klix_id/core/network/dio_client.dart';
import 'package:klix_id/service_locator.dart';

abstract class MovieApiService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovie(String query);
}

class MovieApiServiceImpl extends MovieApiService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var res = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/trailer',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var res = await sl<DioClient>().get(
        ApiUrl.nowPlayingMovies,
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/recommendations',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/similar',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> searchMovie(String query) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.search}movie/$query',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }
}
