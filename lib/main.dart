import 'package:dsx_app/controller/shuffle/shuffle_controller.dart';
import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:dsx_app/firebase_options.dart';
import 'package:dsx_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize GetX controllers
  Get.put(ThemeController());
  Get.put(ShuffleController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final state = themeController.state;
        TextStyle style = TextStyle(color: state.textColor);

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Deversol Official App',
          themeMode:
              themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: state.bgColor,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
            scaffoldBackgroundColor: state.bgColor,
            textTheme: TextTheme(
              displayLarge: style,
              displayMedium: style,
              displaySmall: style,
              headlineLarge: style,
              headlineMedium: style,
              headlineSmall: style,
              titleLarge: style,
              titleMedium: style,
              titleSmall: style,
              bodyLarge: style,
              bodyMedium: style,
              bodySmall: style,
              labelLarge: style,
              labelMedium: style,
              labelSmall: style,
            ),
            fontFamily: 'Aeronik',
            colorScheme: ColorScheme.fromSeed(
              seedColor: state.primaryColor,
              brightness:
                  themeController.isDarkMode
                      ? Brightness.dark
                      : Brightness.light,
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
