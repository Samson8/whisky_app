import 'package:flutter/material.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/feature/home/presentation/main_navigation.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signin';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            AppTheme.plainBackgroundColor, // Ensure AppBar matches bg
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        // Allows scrolling if keyboard appears
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in',
                  style: textTheme.displayMedium,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: AppTheme.primaryColor), // Explicit label color
                    hintText: 'email@email.com',
                  ),
                  style: textTheme.bodyLarge,
                  keyboardType: TextInputType.emailAddress,
                  // TODO: Add controller and validator
                ),
                const SizedBox(height: 24),
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                        color: AppTheme.primaryColor), // Explicit label color
                    hintText: '••••••••',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  style: textTheme.bodyLarge,
                  // TODO: Add controller and validator
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement Sign In Logic
                    print('Continue Tapped');
                    Navigator.pushNamedAndRemoveUntil(context,
                        MainNavigationScreen.routeName, (route) => false);
                  },
                  child: const Text('Continue'),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Can't sign in? ", style: textTheme.bodyMedium),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement Recover Password Action
                            print('Recover Password Tapped');
                          },
                          child: Text(
                            'Recover password',
                            style: textTheme.bodyMedium
                                ?.copyWith(color: AppTheme.primaryColor),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
