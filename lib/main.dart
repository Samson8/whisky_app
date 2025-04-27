import 'package:flutter/material.dart';
import 'package:whisky_app/core/injections.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/feature/home/presentation/bottle_details_screen.dart';
import 'package:whisky_app/feature/auth/presentation/signin_screen.dart';
import 'package:whisky_app/feature/auth/presentation/welcome_screen.dart';
import 'package:whisky_app/feature/home/presentation/main_navigation.dart';

void main() async {
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whisky Collection',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      // Start with the welcome screen for this example
      initialRoute: MainNavigationScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        MainNavigationScreen.routeName: (context) =>
            const MainNavigationScreen(),
        BottleDetailScreen.routeName: (context) => const BottleDetailScreen(),
        // Add other routes here
      },
    );
  }
}
