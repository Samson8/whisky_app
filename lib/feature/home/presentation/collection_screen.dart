import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/core/utils/bloc_resourse.dart';
import 'package:whisky_app/feature/home/presentation/bottle_details_screen.dart';
import 'package:whisky_app/feature/home/presentation/provider/collection_provider.dart';
import 'package:whisky_app/feature/widgets/bottle_grid_item.dart';
import 'package:whisky_app/models/bottle_model.dart';

class MyCollectionScreen extends StatefulWidget {
  static const routeName = '/my-collection';

  const MyCollectionScreen({super.key});

  @override
  State<MyCollectionScreen> createState() => _MyCollectionScreenState();
}

class _MyCollectionScreenState extends State<MyCollectionScreen> {
  TextEditingController searchController = TextEditingController();
  List<BottleModel> filteredList = [];

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
              backgroundColor: AppTheme.cardBackgroundColor,
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
      body: BlocBuilder<CollectionProvider, AppState>(
        builder: (context, state) {
          if (state is AppLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AppLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 2.0, // Horizontal space between items
                mainAxisSpacing: 2.0, // Vertical space between items
                childAspectRatio: 0.5, // Adjust aspect ratio (width / height)
              ),
              itemCount: filteredList.isNotEmpty
                  ? filteredList.length
                  : state.data.length,
              itemBuilder: (context, index) {
                final item = filteredList.isNotEmpty
                    ? filteredList[index]
                    : state.data[index] as BottleModel?;
                return BottleGridItem(
                  bottleItem: item!,
                  onTap: () {
                    Navigator.pushNamed(context, BottleDetailScreen.routeName);
                  },
                );
              },
            );
          } else if (state is AppError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: textTheme.bodyLarge,
              ),
            );
          }
          return const SizedBox.shrink(); // Fallback for other states
        },
      ),
    );
  }
}
