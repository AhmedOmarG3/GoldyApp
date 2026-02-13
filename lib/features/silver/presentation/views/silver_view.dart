import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/constants/app_text_styles.dart';
import 'package:goldy/features/silver/data/repo/silver_repo.dart';
import 'package:goldy/features/silver/presentation/cubit/cubit/silver_cubit.dart';
import 'package:goldy/features/silver/presentation/views/widgets/silver_view_body.dart';

class SilverView extends StatelessWidget {
  const SilverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(SilverRepo())..getSilver(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          title: Text(
            AppStrings.silver,

            style: AppTextStyles.textStyle20Bold.copyWith(
              color: AppColors.silverColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SilverViewBody(),
      ),
    );
  }
}
