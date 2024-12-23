import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klix_id/core/configs/assets/app_images.dart';
import 'package:klix_id/domain/tv/entities/tv_entity.dart';
import 'package:klix_id/presentation/trailers/widgets/recommendations_tvs.dart';
import 'package:klix_id/presentation/trailers/widgets/similar_tvs.dart';

class TvDetails extends StatelessWidget {
  const TvDetails({
    super.key,
    required this.tv,
  });

  final TVEntity tv;

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const subtitleStyle = TextStyle(
      fontSize: 16,
      color: Colors.grey,
    );

    const bodyTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.white,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                if (tv.posterPath != null)
                  SizedBox(
                    height: 600,
                    width: double.infinity,
                    child: Image.network(
                      '${AppImages.movieImageBasePath}${tv.posterPath}',
                      fit: BoxFit.fill,
                      cacheWidth: 800,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) return child;
                        return AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          child: child,
                        );
                      },
                    ),
                  )
                else
                  const SizedBox(
                    height: 400,
                    child: ColoredBox(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          'Poster not available',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _GradientOverlay(),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _buildTvInfo(titleStyle, subtitleStyle),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    tv.overview ?? 'There\'s no overview available',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: bodyTextStyle,
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      if (tv.id != null) ...[
                        RecommendationsTvs(tvId: tv.id!),
                        const SizedBox(height: 16.0),
                        SimilarTvs(tvId: tv.id!),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTvInfo(TextStyle titleStyle, TextStyle subtitleStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tv.name ?? '',
          style: titleStyle,
        ),
        const SizedBox(height: 4.0),
        if (tv.firstAirDate != null)
          Text(
            '${tv.firstAirDate!.year} • Popular TV Show',
            style: subtitleStyle,
          ),
        const SizedBox(height: 8.0),
        _buildRating(subtitleStyle),
      ],
    );
  }

  Widget _buildRating(TextStyle style) {
    final rating = (tv.voteAverage ?? 0) / 2;
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < rating.ceil() ? Colors.yellow : Colors.grey,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        if (tv.voteCount != null)
          Text(
            'From ${tv.voteCount!} users',
            style: style,
          ),
      ],
    );
  }
}

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black87,
            Colors.black,
          ],
          stops: [0.0, 0.7, 1.0],
        ),
      ),
    );
  }
}
