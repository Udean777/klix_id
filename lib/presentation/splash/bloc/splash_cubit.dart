import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/domain/auth/usecases/is_logged_in.dart';
import 'package:klix_id/service_locator.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    var isLoggedin = await sl<IsLoggedIn>().call();

    if (isLoggedin) {
      emit(Authenticated());
    } else {
      emit(
        UnAuthenticated(),
      );
    }
  }
}
