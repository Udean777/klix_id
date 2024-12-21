import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/bloc/generic_data_state.dart';
import 'package:klix_id/core/usecase/usecase.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  Future<void> loadData<T>(Usecase usecase, {dynamic params}) async {
    emit(DataLoading());
    var data = await usecase.call(params: params);

    data.fold(
      (failure) => emit(
        DataError(message: failure),
      ),
      (data) => emit(
        DataLoaded<T>(data: data),
      ),
    );
  }
}
