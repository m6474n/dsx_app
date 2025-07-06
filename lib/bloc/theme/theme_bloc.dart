import 'package:dsx_app/bloc/theme/theme_event.dart';
import 'package:dsx_app/bloc/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const themeKey = 'isDarkMode';
  ThemeBloc() : super(const LightMode()) {
    on<ToggleTheme>(_onToggleTheme);
    _loadSavedTheme();
  }
  Future<void> _onToggleTheme(
    ThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    if (event is ToggleTheme) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(themeKey, event.isDark);

      if (event.isDark) {
        emit(const DarkMode());
      } else {
        emit(const LightMode());
      }
    }
  }

  _loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(themeKey) ?? false;
    add(ToggleTheme(isDark: isDark));
  }
}
