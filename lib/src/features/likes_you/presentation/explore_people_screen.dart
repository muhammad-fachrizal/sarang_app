import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/explore_people_app_bar_widget.dart';
import 'package:sarang_app/src/common_widgets/explore_people_button_widget.dart';
import 'package:sarang_app/src/common_widgets/match_card_widget.dart';
import 'package:sarang_app/src/features/authentication/data/data_user_account_local.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class ExplorePeopleScreen extends StatefulWidget {
  static const String routeName = '/explore-people';
  const ExplorePeopleScreen({super.key});

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  UserAccount? userAccount;
  getDataUserAccount() async {
    final data = await DataUserAccountLocal.getDataUserAccountFromStorage();
    final result = UserAccount.fromMap(data);
    userAccount = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState;
    getDataUserAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: SafeArea(
          child: Column(
            children: [
              ExplorePeopleAppBarWidget(
                imagePath: userAccount?.imageProfile,
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              Expanded(
                child: Column(
                  children: const [
                    Expanded(
                      child: MatchCardWidget(),
                    ),
                    SizedBox(
                      height: AppSize.s50,
                    ),
                    ExplorePeopleButtonWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
