import 'package:flutter/material.dart';
import 'package:klix_id/common/widgets/app_bar.dart';
import 'package:klix_id/domain/movie/entities/movie_entity.dart';
import 'package:klix_id/presentation/trailers/widgets/recommendations_movies.dart';
import 'package:klix_id/presentation/trailers/widgets/similar_movies.dart';
import 'package:klix_id/presentation/trailers/widgets/video_overview.dart';
import 'package:klix_id/presentation/trailers/widgets/video_player.dart';
import 'package:klix_id/presentation/trailers/widgets/video_release_date.dart';
import 'package:klix_id/presentation/trailers/widgets/video_title.dart';
import 'package:klix_id/presentation/trailers/widgets/video_vote_average.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

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
            VideoPlayer(id: movie.id!),
            VideoTitle(
              title: movie.title!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(
                  releaseDate: movie.releaseDate!,
                ),
                VideoVoteAverage(
                  voteAverage: movie.voteAverage!,
                )
              ],
            ),
            VideoOverview(
              overview: movie.overview!,
            ),
            RecommendationsMovies(
              movieId: movie.id!,
            ),
            SimilarMovies(
              movieId: movie.id!,
            )
          ],
        ),
      ),
    );
  }
}
