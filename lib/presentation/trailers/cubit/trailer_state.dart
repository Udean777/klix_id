import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController controller;

  TrailerLoaded({required this.controller});
}

class TrailerError extends TrailerState {
  final String message;

  TrailerError({required this.message});
}
