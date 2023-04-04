import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sarang_app/src/theme_manager/theme_data_manager.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: getApplicationThemeData(),
      initialRoute: SignUpScreen.routeName,
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
      },
    );
  }
}
