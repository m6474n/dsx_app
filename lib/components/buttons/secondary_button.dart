import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const SecondaryButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeState = themeController.state;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(onTap != null ? themeState.textColor : Colors.grey),
        foregroundColor: WidgetStatePropertyAll(themeState.btnTextColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              themeState.defaultBorderRadius,
            ),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}
