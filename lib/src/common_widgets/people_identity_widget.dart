import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class PeopleIdentityWidget extends StatelessWidget {
  const PeopleIdentityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shyna',
            style: getWhiteTextStyle(
              fontSize: FontSizeManager.f28,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          Text(
            '22, Lawyer',
            style: getBlackTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            'I love solving problem in terms of finance, business, and any case. With you, we will solve all world problems.',
            style: getWhiteTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
        ],
      ),
    );
  }
}
