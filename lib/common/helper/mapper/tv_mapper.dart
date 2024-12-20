import 'package:klix_id/data/tv/models/tv_model.dart';
import 'package:klix_id/domain/tv/entities/tv_entity.dart';

class TvMapper {
  static TVEntity toEntity(TVModel tvmodel) {
    return TVEntity(
        adult: tvmodel.adult,
        backdropPath: tvmodel.backdropPath,
        genreIds: tvmodel.genreIds,
        id: tvmodel.id,
        originCountry: tvmodel.originCountry,
        originalLanguage: tvmodel.originalLanguage,
        originalName: tvmodel.originalName,
        overview: tvmodel.overview,
        popularity: tvmodel.popularity,
        posterPath: tvmodel.posterPath,
        firstAirDate: tvmodel.firstAirDate,
        name: tvmodel.name,
        voteAverage: tvmodel.voteAverage,
        voteCount: tvmodel.voteCount);
  }
}
