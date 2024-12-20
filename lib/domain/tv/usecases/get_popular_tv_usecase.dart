import 'package:dartz/dartz.dart';
import 'package:klix_id/core/usecase/usecase.dart';
import 'package:klix_id/domain/tv/repositories/tv_repository.dart';
import 'package:klix_id/service_locator.dart';

class GetPopularTVUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TvRepository>().getPopularTV();
  }
}
