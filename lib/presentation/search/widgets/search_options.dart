import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/presentation/search/cubit/search_cubit.dart';
import 'package:klix_id/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:klix_id/presentation/search/widgets/selectable_options.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOptions(
              title: "Movie",
              isSelected: context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
              onTap: () {
                context.read<SelectableOptionCubit>().selectMovie();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().searchController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            SelectableOptions(
              title: "TV",
              isSelected:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
              onTap: () {
                context.read<SelectableOptionCubit>().selectTV();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().searchController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
