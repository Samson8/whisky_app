import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whisky_app/core/utils/theme.dart';
import 'package:whisky_app/feature/home/presentation/bottle_details_screen.dart';
import 'package:whisky_app/feature/widgets/bottle_grid_item.dart';

class MyCollectionScreen extends StatefulWidget {
  static const routeName = '/my-collection';

  const MyCollectionScreen({super.key});

  @override
  State<MyCollectionScreen> createState() => _MyCollectionScreenState();
}

class _MyCollectionScreenState extends State<MyCollectionScreen> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, String>> _collectionItems = List.generate(
    10, // Example: 10 items
    (index) => {
      'name': 'Springbank 199$index #${1234 + index}',
      'details': '(112/158)',
      'image':
          'assets/images/bottle.png' // Use your placeholder or actual images
    },
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:
            100, // Make the AppBar taller to fit the search field nicely
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'My collection',
                    style: textTheme.displayLarge,
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {
                        // TODO: Implement notification action
                        print('Notifications Tapped');
                      },
                    ),
                    Positioned(
                      right: 12,
                      bottom: 14,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppTheme.error,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            CupertinoSearchTextField(
              placeholder: "Search",
              controller: searchController,
              onSuffixTap: () {
                searchController.clear();
              },
              onChanged: (query) {
                query = query.toLowerCase();
              },
            ),
          ],
        ),
        backgroundColor: AppTheme.backgroundColor, // Match background
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0, // Horizontal space between items
          mainAxisSpacing: 16.0, // Vertical space between items
          childAspectRatio: 0.65, // Adjust aspect ratio (width / height)
        ),
        itemCount: _collectionItems.length,
        itemBuilder: (context, index) {
          final item = _collectionItems[index];
          return BottleGridItem(
            imageUrl: item['image']!,
            name: item['name']!,
            details: item['details']!,
            onTap: () {
              Navigator.pushNamed(context, BottleDetailScreen.routeName);
            },
          );
        },
      ),
    );
  }
}
