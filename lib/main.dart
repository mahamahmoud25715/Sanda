import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanad1_app/core/language_controller.dart';
import 'package:sanad1_app/core/theme_controller.dart';
import 'package:sanad1_app/screens/splash_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final themeController = ThemeController();
  await themeController.loadTheme();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/lang',
      fallbackLocale: const Locale('en'),
      child: MyApp(themeController: themeController),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;

  const MyApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeController),
        ChangeNotifierProvider(
          create: (_) => LanguageController()..loadLang(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,

            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: context.watch<ThemeController>().themeMode,

            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}