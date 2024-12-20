import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
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
    );
  }
}
