import 'package:dartz/dartz.dart';
import 'package:klix_id/core/usecase/usecase.dart';
import 'package:klix_id/domain/movie/repositories/movie_repository.dart';
import 'package:klix_id/service_locator.dart';

class GetNowPlayingUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
}
