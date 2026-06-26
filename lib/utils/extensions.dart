

import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:dsx_app/controller/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ThemeStateExtension on BuildContext{
  ThemeState get customTheme => Get.find<ThemeController>().state;
}
extension ThemeEventExtension on BuildContext{
  ThemeController get themeController => Get.find<ThemeController>();
}