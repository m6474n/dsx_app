import 'package:dsx_app/bloc/theme/theme_bloc.dart';
import 'package:dsx_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onTap;
final String title;
  const GradientButton({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
      final theme = context.theme;
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      constraints: BoxConstraints(minWidth: 100, minHeight: 45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( theme.defaultBorderRadius),
        color: Colors.grey,
        gradient: onTap!=null? LinearGradient(
          colors: [theme.secondaryColor, theme.primaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ):null,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
          child: Text(
            title,
           style: theme.paragraphStyle.copyWith(color: theme.whiteColor),
          ),
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
final VoidCallback? onTap;
final String title;
  const CustomButton({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
       final theme = context.theme;
    return InkWell(
      borderRadius: BorderRadius.circular(theme.defaultBorderRadius),
      onTap: onTap,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
        constraints: BoxConstraints(minWidth: 100, minHeight: 45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( theme.defaultBorderRadius),
         color: onTap!=null? theme.primaryColor: Colors.grey
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
            child: Text(
              title,
              style: theme.paragraphStyle.copyWith(color: theme.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}