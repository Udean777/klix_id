import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:klix_id/presentation/home/bloc/trending_state.dart';
import 'package:klix_id/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var data = await sl<GetTrendingMoviesUsecase>().call();

    data.fold(
      (error) {
        emit(
          FailureLoadTrendingMovies(errorMessage: error),
        );
      },
      (data) {
        emit(
          TrendingMoviesLoaded(movies: data),
        );
      },
    );
  }
}
