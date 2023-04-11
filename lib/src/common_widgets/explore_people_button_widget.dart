import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/match_button_widget.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: 'icon_close.png',
          onTap: () {},
        ),
        MatchButtonWidget(
          dimension: AppSize.s80,
          iconPath: 'icon_love.png',
          onTap: () {},
        ),
        MatchButtonWidget(
          iconPath: 'icon_favorite.png',
          onTap: () {},
        ),
      ],
    );
  }
}
