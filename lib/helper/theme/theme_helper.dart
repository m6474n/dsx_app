import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:dsx_app/controller/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CustomTheme extends StatelessWidget{
 const CustomTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>().state;
    return buildTheme(context, theme);
  }

  Widget buildTheme(BuildContext context, ThemeState theme);
}