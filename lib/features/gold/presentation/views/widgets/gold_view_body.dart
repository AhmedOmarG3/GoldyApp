import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_text_styles.dart';
import 'package:goldy/features/gold/presentation/cubit/gold/gold_cubit.dart';

class GoldViewBody extends StatelessWidget {
  const GoldViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.gold, width: 400, height: 300),

        const SizedBox(height: 16),

        BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoading) {
              return const CircularProgressIndicator();
            }
            if (state is GoldSuccess) {
              return Text(
                '${state.goldModel.price.toStringAsFixed(2)} USD',
                style: AppTextStyles.textStyle20Bold.copyWith(
                  color: AppColors.goldColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            if (state is GoldFailure) {
              return Text(
                state.message,
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle20Bold.copyWith(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              );
            }

            return Text(
              '-- USD',
              style: AppTextStyles.textStyle20Bold.copyWith(
                color: AppColors.goldColor,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
