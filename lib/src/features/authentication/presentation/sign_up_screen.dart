import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/banner_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_text_button_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_text_field_widget.dart';
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
    // implement dispose
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    super.dispose();
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
                //const SizedBox(height: AppSize.s50),
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
                  onTap: () {},
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
