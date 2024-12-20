import 'package:dartz/dartz.dart';
import 'package:klix_id/common/helper/mapper/movie_mapper.dart';
import 'package:klix_id/common/helper/mapper/trailer_mapper.dart';
import 'package:klix_id/core/models/trailer_model.dart';
import 'package:klix_id/data/movie/models/movie_model.dart';
import 'package:klix_id/data/movie/sources/movie_api_service.dart';
import 'package:klix_id/domain/movie/repositories/movie_repository.dart';
import 'package:klix_id/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var data = await sl<MovieApiService>().getTrendingMovies();

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data["data"])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var data = await sl<MovieApiService>().getMovieTrailer(movieId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = TrailerMapper.toEntity(
          TrailerModel.fromJson(
            data["trailer"],
          ),
        );
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var data = await sl<MovieApiService>().getNowPlayingMovies();

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data["data"])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var data = await sl<MovieApiService>().getRecommendationMovies(movieId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data["data"])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var data = await sl<MovieApiService>().getSimilarMovies(movieId);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data["data"])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchMovie(String query) async {
    var data = await sl<MovieApiService>().searchMovie(query);

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data["data"])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();

        return Right(movies);
      },
    );
  }
}
