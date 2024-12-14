import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/widgets/carousel/image_slider.dart';
import 'package:klix_id/core/configs/assets/app_images.dart';
import 'package:klix_id/core/configs/theme/app_colors.dart';
import 'package:klix_id/presentation/home/bloc/trending_cubit.dart';
import 'package:klix_id/presentation/home/bloc/trending_state.dart';

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
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
                  .map(
                    (item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath.toString(),
                  )
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }

          if (state is FailureLoadTrendingMovies) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
