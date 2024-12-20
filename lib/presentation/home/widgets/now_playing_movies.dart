import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
import 'package:klix_id/common/bloc/generic_data_state.dart';
import 'package:klix_id/common/widgets/movie/movie_card.dart';
import 'package:klix_id/domain/movie/entities/movie_entity.dart';
import 'package:klix_id/domain/movie/usecases/get_now_playing_usecase.dart';
import 'package:klix_id/service_locator.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..loadData<List<MovieEntity>>(sl<GetNowPlayingUsecase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.data[index]);
                },
                scrollDirection: Axis.horizontal,
                itemCount: state.data.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            );
          }

          if (state is DataError) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
    );
  }
}
