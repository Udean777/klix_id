// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/presentation/trailers/cubit/trailer_cubit.dart';
import 'package:klix_id/presentation/trailers/cubit/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrailerCubit()..loadTrailer(id),
        child: BlocBuilder<TrailerCubit, TrailerState>(
          builder: (context, state) {
            if (state is TrailerLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is TrailerLoaded) {
              return YoutubePlayer(     
                controller: state.controller,
                showVideoProgressIndicator: true,
              );
            }

            if (state is TrailerError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
