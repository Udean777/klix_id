import 'package:dartz/dartz.dart';
import 'package:klix_id/core/usecase/usecase.dart';
import 'package:klix_id/domain/movie/repositories/movie_repository.dart';
import 'package:klix_id/service_locator.dart';

class SearchMovie extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }
}
