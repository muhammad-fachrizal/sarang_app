import 'package:appinio_swiper/controllers.dart';
import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/match_button_widget.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class ExplorePeopleButtonWidget extends StatelessWidget {
  const ExplorePeopleButtonWidget({
    super.key,
    required this.controller,
  });

  final AppinioSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MatchButtonWidget(
          iconPath: 'icon_close.png',
          onTap: () {
            controller.swipeLeft();
          },
        ),
        MatchButtonWidget(
          dimension: AppSize.s80,
          iconPath: 'icon_love.png',
          onTap: () {
            controller.swipe();
          },
        ),
        MatchButtonWidget(
          iconPath: 'icon_favorite.png',
          onTap: () {
            controller.swipeRight();
          },
        ),
      ],
    );
  }
}
