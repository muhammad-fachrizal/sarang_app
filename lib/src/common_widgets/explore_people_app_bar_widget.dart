import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/logo_widget.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class ExplorePeopleAppBarWidget extends StatelessWidget {
  const ExplorePeopleAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 55.0,
          height: 55.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                '${AssetImageIconManager.assetPath}/user_image.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const LogoWidget(),
        Container(
          width: AppSize.s24,
          height: AppSize.s24,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                '${AssetImageIconManager.assetPath}/icon_notification.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
