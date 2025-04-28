import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/feature/home/presentation/collection_screen.dart';
import 'package:whisky_app/feature/home/presentation/settings_screen.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  const EmptyScreen({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppTheme.plainBackgroundColor,
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  static const routeName = '/main-navigation';

  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1; // Default to 'Collection' tab
  final List<Widget> _pages = [
    const EmptyScreen(
      title: 'Scan screen',
    ),
    const MyCollectionScreen(),
    const EmptyScreen(
      title: 'Shop screen',
    ),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.backgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/scan_icon.svg",
              color: _selectedIndex == 0 ? AppTheme.textColor : AppTheme.grey,
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/squares_icon.svg",
              color: _selectedIndex == 1 ? AppTheme.textColor : AppTheme.grey,
            ),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/bottle_icon.svg",
              color: _selectedIndex == 2 ? AppTheme.textColor : AppTheme.grey,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/gear_icon.svg",
              color: _selectedIndex == 3 ? AppTheme.textColor : AppTheme.grey,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
