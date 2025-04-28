import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/core/utils/snackbar.dart';
import 'package:whisky_app/feature/home/presentation/bloc/collection_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.plainBackgroundColor,
      ),
      backgroundColor: AppTheme.plainBackgroundColor,
      body: Column(
        children: [
          FutureBuilder<bool>(
            future: context.read<CollectionBloc>().getOfflineState(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final isOfflineMode = snapshot.data ?? false;
                return ListTile(
                    title: Text(
                      'Toggle connection',
                      style: textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      "${isOfflineMode ? 'Disable' : 'Enable'} offline mode",
                      style: textTheme.bodySmall,
                    ),
                    trailing: Switch(
                      value: isOfflineMode,
                      activeColor: AppTheme.primaryColor,
                      onChanged: (value) async {
                        await context
                            .read<CollectionBloc>()
                            .toggleOfflineState(value);
                        setState(() {}); // Rebuild to update the FutureBuilder
                        showSnackbar(
                            context,
                            value
                                ? 'Offline mode enabled'
                                : 'Offline mode disabled');
                      },
                    ));
              }
            },
          ),
        ],
      ),
    );
  }
}
