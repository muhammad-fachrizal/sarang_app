import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/banner_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_text_button_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_text_field_widget.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.clear();
    nameController.dispose();
    emailController.clear();
    emailController.dispose();
    passwordController.clear();
    passwordController.dispose();
    super.dispose();
  }

  String? validationInput() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return 'Name, Email, or Password fields can\'t be empty';
    }

    if (passwordController.text.length < 8) {
      return 'Password must be 8 characters or more';
    }

    if (!emailController.text.contains('@')) {
      return 'Email must contain @ symbol';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BannerWidget(),
                CustomTextFieldWidget(
                  labelName: 'Full Name',
                  hintText: 'Write your name',
                  controller: nameController,
                ),
                CustomTextFieldWidget(
                  labelName: 'Email Address',
                  hintText: 'Write your email address',
                  controller: emailController,
                ),
                CustomTextFieldWidget(
                  labelName: 'Password',
                  hintText: 'Write your password',
                  controller: passwordController,
                  isObsecure: true,
                ),
                const SizedBox(
                  height: AppSize.s16,
                ),
                CustomButtonWidget(
                  title: 'Get Started',
                  onTap: () {
                    String? message = validationInput();
                    if (message != null) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpAgeJobScreen(
                              fullName: nameController.text,
                              email: emailController.text,
                              password: passwordController.text),
                        ));
                  },
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                CustomTextButtonWidget(
                  title: 'Sign in to My Account',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
