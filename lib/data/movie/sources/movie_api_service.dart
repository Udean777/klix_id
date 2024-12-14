import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:klix_id/core/constants/api_url.dart';
import 'package:klix_id/core/network/dio_client.dart';
import 'package:klix_id/service_locator.dart';

abstract class MovieApiService {
  Future<Either> getTrendingMovies();
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
}
