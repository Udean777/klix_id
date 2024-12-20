import 'package:dartz/dartz.dart';
import 'package:klix_id/core/usecase/usecase.dart';
import 'package:klix_id/domain/tv/repositories/tv_repository.dart';
import 'package:klix_id/service_locator.dart';

class GetRecommendationTvsUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TvRepository>().getRecommendationTVs(params!);
  }
}
