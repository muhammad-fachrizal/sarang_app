import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/banner_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_text_field_widget.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class SignUpAgeJobScreen extends StatefulWidget {
  static const String routeName = '/sign-up-age-job';
  const SignUpAgeJobScreen({
    super.key,
    required this.fullName,
    required this.email,
    required this.password,
  });

  final String fullName;
  final String email;
  final String password;

  @override
  State<SignUpAgeJobScreen> createState() => _SignUpAgeJobScreenState();
}

class _SignUpAgeJobScreenState extends State<SignUpAgeJobScreen> {
  final jobController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    // implement dispose
    jobController.clear();
    jobController.dispose();
    ageController.clear();
    ageController.dispose();
    super.dispose();
  }

  String? validationInput() {
    if (jobController.text.isEmpty || ageController.text.isEmpty) {
      return 'Occupation or Age fields can\'t be empty';
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
                  labelName: 'Occupation',
                  hintText: 'Write your occupation',
                  controller: jobController,
                ),
                CustomTextFieldWidget(
                  labelName: 'Age',
                  hintText: 'Write your age',
                  controller: ageController,
                ),
                const SizedBox(height: 117.0),
                CustomButtonWidget(
                  title: 'Continue Sign Up',
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
                    UserAccount userAccount = UserAccount(
                      fullName: widget.fullName,
                      email: widget.email,
                      password: widget.password,
                      occupation: jobController.text,
                      age: ageController.text,
                    );
                    Navigator.pushNamed(
                      context,
                      SignUpUploadPhotoScreen.routeName,
                      arguments: userAccount,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
