import 'package:dashboard/config/route/route.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const MyApp());
}

class MyApp extends StatefulHookWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dashboard',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: AppColors.dark().background,
        // primaryColor: AppColors.dark().primary,
        // colorScheme: ColorScheme.dark(
        //   primary: AppColors.dark().primary,
        //   secondary: AppColors.dark().secondary,
        //   background: AppColors.dark().background,
        //   surface: AppColors.dark().surface,
        //   error: AppColors.dark().error,
        //   onPrimary: AppColors.dark().onPrimary,
        //   onSecondary: AppColors.dark().onSecondary,
        //   onBackground: AppColors.dark().onBackground,
        //   onSurface: AppColors.dark().onSurface,
        //   onError: AppColors.dark().onError,
        // ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
