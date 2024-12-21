import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:klix_id/common/helper/navigation/app_navigation.dart';
import 'package:klix_id/common/widgets/app_bar.dart';
import 'package:klix_id/core/configs/assets/app_vectors.dart';
import 'package:klix_id/presentation/home/widgets/now_playing_movies.dart';
import 'package:klix_id/presentation/home/widgets/popular_tv.dart';
import 'package:klix_id/presentation/home/widgets/trending_movies.dart';
import 'package:klix_id/presentation/search/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          child: Column(
            children: [
              TrendingMovies(),
              SizedBox(
                height: 50,
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular TV Shows',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PopularTv(),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Now Playing Movies',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NowPlayingMovies(),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
