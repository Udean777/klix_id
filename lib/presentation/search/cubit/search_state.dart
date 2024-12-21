import 'package:klix_id/domain/movie/entities/movie_entity.dart';
import 'package:klix_id/domain/tv/entities/tv_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MovieLoaded extends SearchState {
  final List<MovieEntity> movies;

  MovieLoaded({required this.movies});
}

class TVsLoaded extends SearchState {
  final List<TVEntity> tvs;

  TVsLoaded({required this.tvs});
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
