import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  const VideoOverview({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          overview,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        )
      ],
    );
  }
}
