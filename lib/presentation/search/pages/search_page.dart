import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/widgets/app_bar.dart';
import 'package:klix_id/presentation/search/cubit/search_cubit.dart';
import 'package:klix_id/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:klix_id/presentation/search/widgets/search_content.dart';
import 'package:klix_id/presentation/search/widgets/search_field.dart';
import 'package:klix_id/presentation/search/widgets/search_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectableOptionCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          )
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16.0,
            children: [
              SearchField(),
              SearchOptions(),
              Expanded(
                child: SearchContent(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
