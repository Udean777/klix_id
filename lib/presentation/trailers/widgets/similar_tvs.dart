import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
import 'package:klix_id/common/bloc/generic_data_state.dart';
import 'package:klix_id/common/widgets/tv/tv_card.dart';
import 'package:klix_id/domain/tv/entities/tv_entity.dart';
import 'package:klix_id/domain/tv/usecases/get_similar_tv_usecase.dart';
import 'package:klix_id/service_locator.dart';

class SimilarTvs extends StatelessWidget {
  const SimilarTvs({
    super.key,
    required this.tvId,
  });

  final int tvId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..loadData<List<TVEntity>>(
          sl<GetSimilarTvsUseCase>(),
          params: tvId,
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
                  "Similar TV Shows",
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
                      return TvCard(
                        tvEntity: state.data[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
