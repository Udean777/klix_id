import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/core/entity/trailer_entity.dart';
import 'package:klix_id/domain/movie/usecases/get_movie_trailer_usecase.dart';
import 'package:klix_id/presentation/trailers/cubit/trailer_state.dart';
import 'package:klix_id/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void loadTrailer(int videoId) async {
    var data = await sl<GetMovieTrailerUsecase>().call(params: videoId);

    data.fold(
      (error) {
        emit(
          TrailerError(message: error),
        );
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );

        emit(
          TrailerLoaded(controller: controller),
        );
      },
    );
  }
}
