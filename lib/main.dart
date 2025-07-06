import 'package:dsx_app/bloc/shuffle/shuffle_bloc.dart';
import 'package:dsx_app/bloc/theme/theme_bloc.dart';
import 'package:dsx_app/bloc/theme/theme_state.dart';
import 'package:dsx_app/controller/theme/theme_controller.dart';
import 'package:dsx_app/firebase_options.dart';
import 'package:dsx_app/routes/app_routes.dart';
import 'package:dsx_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

// var colorManager = Get.put(ColorManager());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => ShuffleBloc()),
      ],

      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          TextStyle _style = TextStyle(color: state.textColor);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Deversol Official App',
            themeMode: state is DarkMode ? ThemeMode.dark : ThemeMode.light,

            theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: state.bgColor,elevation: 0, scrolledUnderElevation: 0),
              scaffoldBackgroundColor: state.bgColor,
              textTheme: TextTheme(
                displayLarge: _style,
                displayMedium: _style,
                displaySmall: _style,
                headlineLarge: _style,
                headlineMedium: _style,
                headlineSmall: _style,
                titleLarge: _style,
                titleMedium: _style,
                titleSmall: _style,
                bodyLarge: _style,
                bodyMedium: _style,
                bodySmall: _style,
                labelLarge: _style,
                labelMedium: _style,
                labelSmall: _style,
              ),
              fontFamily: 'Aeronik',
              colorScheme: ColorScheme.fromSeed(
                seedColor: state.primaryColor,
                brightness:
                    state is DarkMode ? Brightness.dark : Brightness.light,
              ),
            ),
            // initialRoute: AppRoutes.home,
            // getPages: AppRoutes.routes,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
