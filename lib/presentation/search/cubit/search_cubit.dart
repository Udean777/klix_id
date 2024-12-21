import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/domain/movie/usecases/search_movie.dart';
import 'package:klix_id/domain/tv/usecases/search_tv_usecase.dart';
import 'package:klix_id/presentation/search/cubit/search_state.dart';
import 'package:klix_id/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:klix_id/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController searchController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());
      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTV(query);
          break;
      }
    }
  }

  void searchMovie(String query) async {
    var data = await sl<SearchMovieUsecase>().call(params: query);

    data.fold(
      (error) {
        emit(
          SearchError(message: error),
        );
      },
      (data) {
        emit(
          MovieLoaded(movies: data),
        );
      },
    );
  }

  void searchTV(String query) async {
    var data = await sl<SearchTVUseCase>().call(params: query);

    data.fold(
      (error) {
        emit(
          SearchError(message: error),
        );
      },
      (data) {
        emit(
          TVsLoaded(tvs: data),
        );
      },
    );
  }
}
