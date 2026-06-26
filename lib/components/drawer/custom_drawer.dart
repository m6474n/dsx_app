import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:dsx_app/controller/theme/theme_state.dart';
import 'package:dsx_app/ui/game/lottery_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final theme = themeController.state;
        return Drawer(
          backgroundColor: theme.bgColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 24, right: 24),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        "DSX Personal Assistant",
                        style: theme.headingStyle.copyWith(
                          letterSpacing: 1.2,
                          height: 1,
                          fontWeight: FontWeight.w900,
                          color: theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Where Technology Meets Diversity",
                        style: theme.paragraphStyle.copyWith(
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Divider(),
                      const SizedBox(height: 24),
                      _drawerItem(
                        theme: theme,
                        icon: HugeIcons.strokeRoundedUser,
                        title: "Profile",
                        onTap: () {},
                      ),
                      _drawerItem(
                        theme: theme,
                        icon: HugeIcons.strokeRoundedGame,
                        title: "Games",
                        onTap: () {
                          Get.to(() => const LotteryGame());
                        },
                      ),
                      _drawerItem(
                        theme: theme,
                        icon:
                            themeController.isDarkMode
                                ? HugeIcons.strokeRoundedSun01
                                : HugeIcons.strokeRoundedMoon,
                        title:
                            themeController.isDarkMode
                                ? "Light Mode"
                                : "Dark Mode",
                        onTap: () {
                          themeController.toggleTheme(
                            !themeController.isDarkMode,
                          );
                        },
                      ),
                      _drawerItem(
                        theme: theme,
                        icon: HugeIcons.strokeRoundedSettings01,
                        title: "Setting",
                        onTap: () {},
                      ),
                      _drawerItem(
                        theme: theme,
                        icon: HugeIcons.strokeRoundedLogout02,
                        title: "Logout",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Text("Version: 1.0.0", style: theme.paragraphStyle),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _drawerItem({
    required ThemeState theme,
    IconData? icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          spacing: 12,
          children: [
            if (icon != null) HugeIcon(icon: icon, color: theme.textColor),
            Expanded(
              child: Text(
                title,
                style: theme.paragraphStyle.copyWith(color: theme.textColor),
              ),
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              color: theme.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
