import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/core/utils/bloc_resourse.dart';
import 'package:whisky_app/core/utils/snackbar.dart';
import 'package:whisky_app/feature/auth/presentation/bloc/auth_bloc.dart';
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
  final TextEditingController emailController =
      TextEditingController(text: 'john@mail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'password123');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.plainBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),
      backgroundColor: AppTheme.plainBackgroundColor,
      body: BlocListener<AuthBloc, AppState>(
        listener: (context, state) {
          if (state is AppLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainNavigationScreen.routeName,
                (route) => false,
              );
            });
          } else if (state is AppError) {
            showSnackbar(context, state.message); // Show error message
          }
        },
        child: SingleChildScrollView(
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
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppTheme.primaryColor),
                      hintText: 'email@email.com',
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter your email'
                        : null,
                    style: textTheme.bodyLarge,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: AppTheme.primaryColor),
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
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter your password'
                        : null,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<AuthBloc>().add(SignInEvent(
                              emailController.text,
                              passwordController.text,
                            ));
                      }
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
                              showSnackbar(context, 'Recover Password Tapped');
                            },
                            child: Text(
                              'Recover password',
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: AppTheme.primaryColor),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
