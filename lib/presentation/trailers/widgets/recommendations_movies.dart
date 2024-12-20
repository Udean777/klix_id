import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
import 'package:klix_id/common/bloc/generic_data_state.dart';
import 'package:klix_id/common/widgets/movie/movie_card.dart';
import 'package:klix_id/domain/movie/entities/movie_entity.dart';
import 'package:klix_id/domain/movie/usecases/get_reccommendations_movies_usecase.dart';
import 'package:klix_id/service_locator.dart';

class RecommendationsMovies extends StatelessWidget {
  const RecommendationsMovies({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..loadData<List<MovieEntity>>(
          sl<GetReccommendationsMoviesUsecase>(),
          params: movieId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recommendations",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.data[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          if (state is DataError) {
            return Text(state.message);
          }

          return Container();
        },
      ),
    );
  }
}
