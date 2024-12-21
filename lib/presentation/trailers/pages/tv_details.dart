import 'package:flutter/material.dart';
import 'package:klix_id/common/widgets/app_bar.dart';
import 'package:klix_id/domain/tv/entities/tv_entity.dart';
import 'package:klix_id/presentation/trailers/widgets/recommendations_tvs.dart';
import 'package:klix_id/presentation/trailers/widgets/similar_tvs.dart';
import 'package:klix_id/presentation/trailers/widgets/tv_keywords.dart';
import 'package:klix_id/presentation/trailers/widgets/video_overview.dart';
import 'package:klix_id/presentation/trailers/widgets/video_player.dart';
import 'package:klix_id/presentation/trailers/widgets/video_title.dart';
import 'package:klix_id/presentation/trailers/widgets/video_vote_average.dart';

class TvDetails extends StatelessWidget {
  const TvDetails({
    super.key,
    required this.tv,
  });

  final TVEntity tv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tv.id!),
            VideoTitle(
              title: tv.name!,
            ),
            TvKeywords(
              tvId: tv.id!,
            ),
            VideoVoteAverage(
              voteAverage: tv.voteAverage!,
            ),
            VideoOverview(
              overview: tv.overview!,
            ),
            RecommendationsTvs(
              tvId: tv.id!,
            ),
            SimilarTvs(
              tvId: tv.id!,
            )
          ],
        ),
      ),
    );
  }
}
