import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:postme/common/round_small_button.dart';
import 'package:postme/constants/constants.dart';
import 'package:postme/features/auth/view/signup_view.dart';
import 'package:postme/features/auth/widgets/auth_field.dart';
import 'package:postme/theme/pallete.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appbar = UIConstants.appbar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const Text('Login',
                  style: TextStyle(color: Pallete.blueColor, fontSize: 40)),
              const SizedBox(height: 40),
              AuthField(controller: emailController, hintText: 'Email'),
              const SizedBox(height: 40),
              AuthField(
                controller: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.topRight,
                child: RoundedSmallButton(
                  onTap: () {},
                  label: 'Done',
                  backgroundColor: Pallete.blueColor,
                  textColor: Pallete.whiteColor,
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                  text: TextSpan(
                      text: "Don't have account?",
                      style: const TextStyle(fontSize: 16),
                      children: [
                    TextSpan(
                        text: ' Sign up',
                        style: const TextStyle(
                            color: Pallete.blueColor, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context, SignUpView.route());
                          }),
                  ]))
            ]),
          ),
        ),
      ),
    );
  }
}
