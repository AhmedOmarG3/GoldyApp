import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/widgets/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            CustomButton(
              onPressed: () {
                
              },
              textColor: AppColors.blackColor,
              title: AppStrings.gold,
              buttonColor: AppColors.goldColor,
            ),
            CustomButton(
              onPressed: () {
                
              },
              textColor: AppColors.blackColor,
              title: AppStrings.silver,
              buttonColor: AppColors.silverColor,
            ),
          ],
        ),
      ),
    );
  }
}
