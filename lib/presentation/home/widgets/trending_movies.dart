import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
import 'package:klix_id/common/helper/navigation/app_navigation.dart';
import 'package:klix_id/common/widgets/carousel/image_carousel.dart';
import 'package:klix_id/core/configs/assets/app_images.dart';
import 'package:klix_id/domain/movie/entities/movie_entity.dart';
import 'package:klix_id/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:klix_id/presentation/home/bloc/trending_cubit.dart';
import 'package:klix_id/presentation/home/bloc/trending_state.dart';
import 'package:klix_id/presentation/trailers/pages/movie_details.dart';
import 'package:klix_id/service_locator.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TrendingMoviesLoaded) {
            return ImageCarousel(
              imageUrls: state.movies
                  .map(
                    (item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath.toString(),
                  )
                  .toList(),
              onImageTap: (index) {
                final selectedMovie = state.movies[index];

                AppNavigation.push(
                  context,
                  MovieDetails(movie: selectedMovie),
                );
              },
            );
          }

          if (state is FailureLoadTrendingMovies) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.errorMessage),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<GenericDataCubit>()
                          .loadData<List<MovieEntity>>(
                            sl<GetTrendingMoviesUsecase>(),
                          );
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
