import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postme/common/loading_widget.dart';
import 'package:postme/features/auth/view/login_view.dart';

import '../../../common/round_small_button.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme.dart';
import '../controller/auth_controller.dart';
import '../widgets/auth_field.dart';

//ConsumerStatefulWidget gives access to widget ref means we can can provider by widget

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIConstants.appbar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

/* 
***********While using stateNotfier************
ref.read(authControllerProvider.notifier)....
using notifier, we can access class instance, so we can access class function

ref.read(authControllerProvider)
without notifier it returns bool value as mention in authControllerProvider
 */
  void onSignUp() {
    // final res = ref.read(authControllerProvider.notifier).signUp(
    //     email: emailController.text,
    //     password: passwordController.text,
    //     context: context);

    final authControllerForFirebase = ref
        .watch(authControllerProviderForFirebase.notifier)
        .signUpWithFirebase(
            email: emailController.text,
            password: passwordController.text,
            context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProviderForFirebase);

    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const Text('Signup',
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
                child: isLoading
                    ? const Loader()
                    : RoundedSmallButton(
                        onTap: onSignUp,
                        label: 'Done',
                        backgroundColor: Pallete.blueColor,
                        textColor: Pallete.whiteColor,
                      ),
              ),
              const SizedBox(height: 40),
              RichText(
                  text: TextSpan(
                      text: "Already have account?",
                      style: const TextStyle(fontSize: 16),
                      children: [
                    TextSpan(
                        text: ' Login',
                        style: const TextStyle(
                            color: Pallete.blueColor, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context, LoginView.route());
                          }),
                  ]))
            ]),
          ),
        ),
      ),
    );
  }
}
