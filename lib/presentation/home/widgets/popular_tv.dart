import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
import 'package:klix_id/common/bloc/generic_data_state.dart';
import 'package:klix_id/common/widgets/tv/tv_card.dart';
import 'package:klix_id/domain/tv/entities/tv_entity.dart';
import 'package:klix_id/domain/tv/usecases/get_popular_tv_usecase.dart';
import 'package:klix_id/service_locator.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..loadData<List<TVEntity>>(
          sl<GetPopularTVUseCase>(),
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return TvCard(
                    tvEntity: state.data[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
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
