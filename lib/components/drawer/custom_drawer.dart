import 'package:dsx_app/ui/game/lottery_game.dart';
import 'package:dsx_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomDrawer extends StatelessWidget {
  // final List
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Drawer(
      backgroundColor: theme.bgColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, bottom: 24, right: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 12),
                  Image(image: AssetImage('assets/images/logo.png')),
                  SizedBox(height: 6),
                  Text(
                    "Where Technology Meets Diversity",
                    style: theme.paragraphStyle.copyWith(letterSpacing: 1.2),
                  ),
                  SizedBox(height: 6),
                  Divider(),
                  SizedBox(height: 24),
                  _drawerItem(
                    context,
                    icon: HugeIcons.strokeRoundedUser,
                    title: "Profile",
                    onTap: () {},
                  ),
                  _drawerItem(
                    context,
                    icon: HugeIcons.strokeRoundedGame,
                    title: "Games",
                    onTap: () {
                      Navigator.push(
                        (context),
                        MaterialPageRoute(builder: (_) => LotteryGame()),
                      );
                    },
                  ),
                  _drawerItem(
                    context,
                    icon: HugeIcons.strokeRoundedSettings01,
                    title: "Setting",
                    onTap: () {},
                  ),
                  _drawerItem(
                    context,
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
  }

  Widget _drawerItem(
    BuildContext context, {
    IconData? icon,
    required String title,
    VoidCallback? onTap,
  }) {
    final theme = context.theme;

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
            ), // le
          ],
        ),
      ),
    );
  }
}
