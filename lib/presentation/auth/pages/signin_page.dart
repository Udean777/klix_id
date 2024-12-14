import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:klix_id/common/helper/message/display_message.dart';
import 'package:klix_id/common/helper/navigation/app_navigation.dart';
import 'package:klix_id/common/widgets/reactive_button/reactive_button.dart';
import 'package:klix_id/core/configs/theme/app_colors.dart';
import 'package:klix_id/data/auth/models/signin_req_params.dart';
import 'package:klix_id/domain/auth/usecases/signin_usecase.dart';
import 'package:klix_id/presentation/auth/pages/signup_page.dart';
import 'package:klix_id/service_locator.dart';
import 'package:klix_id/presentation/home/pages/home_page.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash-bg.png"),
              fit: BoxFit.cover,
              opacity: 0.05,
            ),
          ),
          child: SafeArea(
            minimum: const EdgeInsets.only(
              top: 100,
              right: 16,
              left: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signInText(),
                const SizedBox(
                  height: 30.0,
                ),
                _emailField(),
                const SizedBox(
                  height: 16.0,
                ),
                _passwordField(),
                const SizedBox(
                  height: 30.0,
                ),
                _signInButton(context),
                const SizedBox(
                  height: 16.0,
                ),
                _signUpText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async => sl<SigninUsecase>().call(
        params: SigninReqParams(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      ),
      onSuccess: () {
        AppNavigation.pushAndRemove(
          context,
          HomePage(),
        );
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
        // print(error);
      },
    );
  }

  Widget _signInText() {
    return Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Doesn't have an account?",
          ),
          TextSpan(
            text: " Sign Up",
            style: TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.push(
                  context,
                  SignupPage(),
                );
              },
          ),
        ],
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: "Email",
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: "Password",
      ),
    );
  }
}
