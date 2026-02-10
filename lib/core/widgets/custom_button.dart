import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.buttonColor,
    required this.textColor, this.height, this.width,
  });
  final Color textColor;
  final String title;
  final void Function()? onPressed;
  final Color? buttonColor;
  final double? height ;
  final double? width ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(
          Size(width?? MediaQuery.of(context).size.width / 2,height?? 50),
        ),
        backgroundColor: WidgetStatePropertyAll(buttonColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.textStyle20Bold.copyWith(color: textColor),
      ),
    );
  }
}
