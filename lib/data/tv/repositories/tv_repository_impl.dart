import 'package:dartz/dartz.dart';
import 'package:klix_id/common/helper/mapper/keyword_mapper.dart';
import 'package:klix_id/common/helper/mapper/tv_mapper.dart';
import 'package:klix_id/core/models/keyword_model.dart';
import 'package:klix_id/data/tv/models/tv_model.dart';
import 'package:klix_id/data/tv/sources/tv_services.dart';
import 'package:klix_id/domain/tv/repositories/tv_repository.dart';
import 'package:klix_id/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TvServices>().getKeywords(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['data'])
          .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getPopularTV() async {
    var data = await sl<TvServices>().getPopularTv();

    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['data'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var data = await sl<TvServices>().getRecommendationTVs(tvId);
    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['data'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var data = await sl<TvServices>().getSimilarTVs(tvId);
    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['data'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> searchTV(String query) async {
    var data = await sl<TvServices>().searchTV(query);
    return data.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['data'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
