import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_cubit.dart';
import 'package:klix_id/common/helper/navigation/app_navigation.dart';
import 'package:klix_id/common/widgets/app_bar.dart';
import 'package:klix_id/domain/movie/entities/movie_entity.dart';
import 'package:klix_id/domain/movie/usecases/get_now_playing_usecase.dart';
import 'package:klix_id/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:klix_id/domain/tv/entities/tv_entity.dart';
import 'package:klix_id/domain/tv/usecases/get_popular_tv_usecase.dart';
import 'package:klix_id/presentation/home/widgets/now_playing_movies.dart';
import 'package:klix_id/presentation/home/widgets/popular_tv.dart';
import 'package:klix_id/presentation/home/widgets/trending_movies.dart';
import 'package:klix_id/presentation/search/pages/search_page.dart';
import 'package:klix_id/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _refreshData(BuildContext context) async {
    final futures = [
      context.read<GenericDataCubit>().loadData<List<MovieEntity>>(
            sl<GetTrendingMoviesUsecase>(),
          ),
      context.read<GenericDataCubit>().loadData<List<MovieEntity>>(
            sl<GetNowPlayingUsecase>(),
          ),
      context.read<GenericDataCubit>().loadData<List<TVEntity>>(
            sl<GetPopularTVUseCase>(),
          ),
    ];

    await Future.wait(futures);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            AppNavigation.push(
              context,
              const SearchPage(),
            );
          },
        ),
        title: Text(
          'Klix ID',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshData(context),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Column(
              children: [
                TrendingMovies(),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular TV Shows',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopularTv(),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Now Playing Movies',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    NowPlayingMovies(),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
