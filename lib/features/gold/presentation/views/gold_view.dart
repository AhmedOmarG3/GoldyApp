import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/constants/app_text_styles.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:goldy/features/gold/presentation/cubit/gold/gold_cubit.dart';
import 'package:goldy/features/gold/presentation/views/widgets/gold_view_body.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepo())..getGold(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          title: Text(
            AppStrings.gold,

            style: AppTextStyles.textStyle20Bold.copyWith(
              color: AppColors.goldColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: GoldViewBody(),
      ),
    );
  }
}
