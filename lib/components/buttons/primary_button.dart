import 'package:dsx_app/bloc/theme/theme_state.dart';
import 'package:dsx_app/helper/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends CustomTheme {
  final String title;
  final VoidCallback? onTap;
  const PrimaryButton({super.key, required this.title,  this.onTap});

  @override
  Widget buildTheme(BuildContext context, ThemeState theme) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(onTap!=null?  theme.primaryColor: Colors.grey),
        foregroundColor: WidgetStatePropertyAll(theme.whiteColor),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.defaultBorderRadius),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(title, ),
    );
  }
}
