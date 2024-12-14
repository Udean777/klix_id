import 'package:dartz/dartz.dart';
import 'package:klix_id/common/helper/mapper/movie_mapper.dart';
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
        var movies = List.from(data["content"])
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
