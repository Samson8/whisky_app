import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisky_app/core/injections.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:whisky_app/feature/home/presentation/bloc/collection_bloc.dart';
import 'package:whisky_app/feature/home/presentation/bottle_details_screen.dart';
import 'package:whisky_app/feature/auth/presentation/signin_screen.dart';
import 'package:whisky_app/feature/auth/presentation/welcome_screen.dart';
import 'package:whisky_app/feature/home/presentation/main_navigation.dart';

void main() async {
  await initInjections();
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        SignInScreen.routeName: (context) => BlocProvider(
            create: (_) => AuthBloc(), child: const SignInScreen()),
        MainNavigationScreen.routeName: (context) => BlocProvider(
            create: (_) => CollectionBloc(),
            child: const MainNavigationScreen()),
        BottleDetailScreen.routeName: (context) => BlocProvider(
            create: (_) => CollectionBloc(), child: const BottleDetailScreen()),
        // Add other routes here
      },
    );
  }
}
