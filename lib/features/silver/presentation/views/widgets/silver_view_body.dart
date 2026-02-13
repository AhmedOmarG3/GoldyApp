import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_text_styles.dart';
import 'package:goldy/features/silver/presentation/cubit/cubit/silver_cubit.dart';

class SilverViewBody extends StatelessWidget {
  const SilverViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.silver, width: 400, height: 300),

        const SizedBox(height: 16),

        BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverLoading) {
              return const CircularProgressIndicator();
            }
            if (state is SilverSuccess) {
              return Text(
                '${state.silverModel.price.toStringAsFixed(2)} USD',
                style: AppTextStyles.textStyle20Bold.copyWith(
                  color: AppColors.silverColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            if (state is SilverFailure) {
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
