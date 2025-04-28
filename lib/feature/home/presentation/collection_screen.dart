import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/core/utils/bloc_resourse.dart';
import 'package:whisky_app/core/utils/snackbar.dart';
import 'package:whisky_app/feature/home/presentation/bottle_details_screen.dart';
import 'package:whisky_app/feature/home/presentation/bloc/collection_bloc.dart';
import 'package:whisky_app/widgets/bottle_grid_item.dart';
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
  void initState() {
    super.initState();
    context.read<CollectionBloc>().add(LoadCollections());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // toolbarHeight:
        //     100, // Make the AppBar taller to fit the search field nicely
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
                        showSnackbar(context, 'Notifications Tapped');
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
            // Search field - not sure if its part of requirement
            // const SizedBox(height: 10),
            // CupertinoSearchTextField(
            //   placeholder: "Search",
            //   controller: searchController,
            //   backgroundColor: AppTheme.cardBackgroundColor,
            //   onSuffixTap: () {
            //     searchController.clear();
            //   },
            //   onChanged: (query) {
            //     query = query.toLowerCase();
            //   },
            // ),
          ],
        ),
        surfaceTintColor: AppTheme.plainBackgroundColor,
        backgroundColor: AppTheme.plainBackgroundColor, // Match background
      ),
      backgroundColor: AppTheme.plainBackgroundColor,
      body: BlocBuilder<CollectionBloc, AppState>(
        builder: (context, state) {
          if (state is AppLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AppLoaded) {
            final bottles = state.data;
            if (bottles.isEmpty) {
              return const Center(child: Text('No collections found'));
            }
            return GridView.builder(
              itemCount: bottles.length,
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) {
                final bottle = bottles[index];
                return BottleGridItem(
                  bottleItem: bottle,
                  onTap: () {
                    Navigator.pushNamed(context, BottleDetailScreen.routeName,
                        arguments: {
                          'bottleId': bottle.id,
                        });
                  },
                );
              },
            );
          } else if (state is AppError) {
            return Center(
                child: Text(state?.message ?? 'Error loading collections'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
