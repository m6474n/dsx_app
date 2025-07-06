abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent{
  final bool isDark;
  ToggleTheme({required this.isDark});
  

}