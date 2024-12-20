import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:klix_id/common/widgets/app_bar.dart';
import 'package:klix_id/core/configs/assets/app_vectors.dart';
import 'package:klix_id/presentation/home/widgets/popular_tv.dart';
import 'package:klix_id/presentation/home/widgets/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: SvgPicture.asset(
          AppVectors.logo,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrendingMovies(),
            SizedBox(
              height: 16,
            ),
            PopularTv(),
          ],
        ),
      ),
    );
  }
}
