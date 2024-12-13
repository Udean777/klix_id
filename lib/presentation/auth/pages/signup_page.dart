import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:klix_id/common/helper/message/display_message.dart';
import 'package:klix_id/common/helper/navigation/app_navigation.dart';
import 'package:klix_id/common/widgets/reactive_button/reactive_button.dart';
import 'package:klix_id/core/configs/theme/app_colors.dart';
import 'package:klix_id/data/auth/models/signup_req_params.dart';
import 'package:klix_id/domain/auth/usecases/signup_usecase.dart';
import 'package:klix_id/presentation/auth/pages/signin_page.dart';
import 'package:klix_id/presentation/home/pages/home_page.dart';
import 'package:klix_id/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

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
                _signUpText(),
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
                _signUpButton(context),
                const SizedBox(
                  height: 16.0,
                ),
                _signInText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign Up",
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignupUsecase>().call(
          params: SignupReqParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigation.pushAndRemove(
          context,
          HomePage(),
        );
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText() {
    return Text(
      "Sign Up",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Already have an account?",
          ),
          TextSpan(
            text: " Sign In",
            style: TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.push(
                  context,
                  SigninPage(),
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
