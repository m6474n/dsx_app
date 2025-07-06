

import 'package:dsx_app/bloc/theme/theme_bloc.dart';
import 'package:dsx_app/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ThemeStateExtension on BuildContext{
  ThemeState get theme => read<ThemeBloc>().state;
}
extension ThemeEventExtension on BuildContext{
  ThemeBloc get themeController => read<ThemeBloc>();
}