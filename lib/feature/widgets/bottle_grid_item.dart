import 'package:flutter/material.dart';
import 'package:whisky_app/core/utils/theme.dart';

class BottleGridItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String details;
  final VoidCallback onTap;

  const BottleGridItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.details,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppTheme.cardBackgroundColor,
        elevation: 2, // Subtle shadow
        clipBehavior: Clip.antiAlias, // Clip image corners if needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          // Add padding around the content inside the card
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0), // Space for image
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.contain, // Fit bottle within the space
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: textTheme.bodyMedium
                    ?.copyWith(fontSize: 15), // Slightly smaller
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                details,
                // style: textTheme.caption,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8), // Padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
