import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class GlassCardWidget extends StatelessWidget {
  const GlassCardWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s80,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p15,
        horizontal: AppPadding.p24,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m26,
        horizontal: AppMargin.m30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSize.s33,
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            '${AssetImageIconManager.assetPath}/glass_card_image.png',
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f20,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
              Text(
                '${user.age}, ${user.occupation}',
                style: getWhiteTextStyle(
                  fontSize: FontSizeManager.f14,
                ),
              ),
            ],
          ),
          Container(
            width: AppSize.s50,
            height: AppSize.s50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '${AssetImageIconManager.assetPath}/icon_profile.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
