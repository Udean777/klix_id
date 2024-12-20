import 'package:dartz/dartz.dart';
import 'package:klix_id/core/usecase/usecase.dart';
import 'package:klix_id/domain/movie/repositories/movie_repository.dart';
import 'package:klix_id/service_locator.dart';

class GetMovieTrailerUsecase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) {
    return sl<MovieRepository>().getMovieTrailer(params!);
  }
}
