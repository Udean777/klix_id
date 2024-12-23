import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/service_locator.dart';
import 'core/configs/theme/app_theme.dart';
import 'presentation/splash/bloc/splash_cubit.dart';
import 'presentation/splash/pages/splash.dart';
import 'common/bloc/generic_data_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit()..appStarted(),
        ),
        BlocProvider(
          create: (context) => GenericDataCubit(),
        ),
      ],
      child: MaterialApp(
        title: "Klix ID",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
