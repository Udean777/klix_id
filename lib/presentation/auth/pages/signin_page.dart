import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:klix_id/common/helper/navigation/app_navigation.dart';
import 'package:klix_id/common/widgets/reactive_button/reactive_button.dart';
import 'package:klix_id/core/configs/theme/app_colors.dart';
import 'package:klix_id/presentation/auth/pages/signup_page.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              _signInButton(),
              const SizedBox(
                height: 16.0,
              ),
              _signUpText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
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
      decoration: InputDecoration(
        hintText: "Email",
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Password",
      ),
    );
  }
}
