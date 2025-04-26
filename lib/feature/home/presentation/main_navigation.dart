import 'package:flutter/material.dart';
import 'package:whisky_app/core/utils/theme.dart';
import 'package:whisky_app/feature/home/presentation/collection_screen.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  const EmptyScreen({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // automaticallyImplyLeading: false, // Remove back button if needed
        backgroundColor: AppTheme.backgroundColor, // Match background
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
    const EmptyScreen(
      title: 'Settings screen',
    ),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded), // Or Icons.collections
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined), // Or Icons.shopping_bag
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
