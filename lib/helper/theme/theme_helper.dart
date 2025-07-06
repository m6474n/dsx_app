import 'package:dsx_app/bloc/theme/theme_bloc.dart';
import 'package:dsx_app/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CustomTheme extends StatelessWidget{
 const CustomTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeBloc>().state;
    return buildTheme(context, theme);
  }

  Widget buildTheme(BuildContext context, ThemeState theme);
}