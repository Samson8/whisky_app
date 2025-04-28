import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/feature/auth/presentation/signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        // Background Pattern
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_pattern.png"),
            fit: BoxFit.cover,
          ),
          color: AppTheme.backgroundColor,
        ),
        child: SafeArea(
          // Keep content within safe areas
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Align content bottom
              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch button
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.cardBackgroundColor,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        'Welcome!',
                        style: textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Scan your bottle to get started',
                        style: GoogleFonts.lato().copyWith(
                            color: AppTheme.subtleTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement Scan Bottle Action
                          print('Scan Bottle Tapped');
                          // Example Navigation (replace with actual logic)
                          // Navigator.pushNamed(context, ScanScreen.routeName);
                        },
                        child: const Text('Scan bottle'),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Have an account? ',
                              style: GoogleFonts.lato().copyWith(
                                  color: AppTheme.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                            child: Text('Sign in first',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppTheme.primaryColor,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
