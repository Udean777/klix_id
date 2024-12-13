import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klix_id/common/helper/navigation/app_navigation.dart';
import 'package:klix_id/core/configs/assets/app_images.dart';
import 'package:klix_id/presentation/auth/pages/signin_page.dart';
import 'package:klix_id/presentation/home/pages/home_page.dart';
import 'package:klix_id/presentation/splash/bloc/splash_cubit.dart';
import 'package:klix_id/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigation.pushReplacement(
              context,
              SigninPage(),
            );
          }

          if (state is Authenticated) {
            AppNavigation.pushReplacement(
              context,
              HomePage(),
            );
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  AppImages.splashBg,
                ),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    // ignore: deprecated_member_use
                    Color(0xFF1A1B20).withOpacity(0),
                    Color(0xFF1A1B20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
