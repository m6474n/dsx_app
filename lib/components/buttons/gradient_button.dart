import 'package:dsx_app/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build(BuildContext context) {
      final theme = context.read<ThemeBloc>();
    return Container(
      constraints: BoxConstraints(minWidth: 100, minHeight: 45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( theme.state.defaultBorderRadius),
        gradient: LinearGradient(
          colors: [theme.state.secondaryColor, theme.state.primaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
          child: Text(
            "Click Me",
            style: TextStyle(color:  theme.state.whiteColor),
          ),
        ),
      ),
    );
  }
}