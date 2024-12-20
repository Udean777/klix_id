import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:klix_id/core/constants/api_url.dart';
import 'package:klix_id/core/network/dio_client.dart';
import 'package:klix_id/service_locator.dart';

abstract class TvServices {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTV(String query);
}

class TvServicesImpl implements TvServices {
  @override
  Future<Either> getKeywords(int tvId) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/keywords',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getPopularTv() async {
    try {
      var res = await sl<DioClient>().get(ApiUrl.popularTV);

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/similar',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> searchTV(String query) async {
    try {
      var res = await sl<DioClient>().get(
        '${ApiUrl.search}tv/$query',
      );

      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }
}
