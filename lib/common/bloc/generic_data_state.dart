abstract class GenericDataState {}

class DataLoading extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {
  final T data;

  DataLoaded({required this.data});
}

class DataError extends GenericDataState {
  final String message;

  DataError({required this.message});
}
