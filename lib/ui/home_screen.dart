import 'package:dsx_app/controller/shuffle/shuffle_controller.dart';
import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:dsx_app/controller/theme/theme_state.dart';
import 'package:dsx_app/components/buttons/primary_button.dart';
import 'package:dsx_app/components/buttons/secondary_button.dart';
import 'package:dsx_app/components/drawer/custom_drawer.dart';
import 'package:dsx_app/ui/game/lottery_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final theme = themeController.state;
        return Scaffold(
          appBar: AppBar(title: const Text("DSX Personal Assistant")),
          drawer: const CustomDrawer(),
        );
      },
    );
  }
}
