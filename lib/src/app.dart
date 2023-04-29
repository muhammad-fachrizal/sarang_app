import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_upload_photo_screen.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_profile_screen.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_you_loved_screen.dart';
import 'package:sarang_app/src/theme_manager/theme_data_manager.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool isRegistered = false;
  isUserRegistered() async {
    isRegistered = await UserAccountRegister.getUserAccountRegister();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isUserRegistered();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: getApplicationThemeData(),
      home: isRegistered ? const ExplorePeopleScreen() : const SignUpScreen(),
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        SignUpUploadPhotoScreen.routeName: (context) =>
            const SignUpUploadPhotoScreen(),
        ExplorePeopleScreen.routeName: (context) => const ExplorePeopleScreen(),
        PeopleYouLovedScreen.routeName: (context) =>
            const PeopleYouLovedScreen(),
        PeopleProfileScreen.routeName: (context) => const PeopleProfileScreen(),
      },
    );
  }
}
