import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
import 'package:klix_id/common/bloc/generic_data_state.dart';
import 'package:klix_id/core/entity/keyword_entity.dart';
import 'package:klix_id/domain/tv/usecases/get_tv_keywords_usecase.dart';
import 'package:klix_id/service_locator.dart';

class TvKeywords extends StatelessWidget {
  const TvKeywords({
    super.key,
    required this.tvId,
  });

  final int tvId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..loadData<List<KeywordEntity>>(
          sl<GetTvKeywordsUsecase>(),
          params: tvId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            List<KeywordEntity> keywords = state.data;

            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: keywords
                  .map(
                    (keyword) => Chip(
                      label: Text(keyword.name!),
                      backgroundColor: Colors.grey[300],
                    ),
                  )
                  .toList(),
            );
          }

          if (state is DataError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
