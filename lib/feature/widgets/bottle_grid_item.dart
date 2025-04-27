import 'package:flutter/material.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/models/bottle_model.dart';

class BottleGridItem extends StatelessWidget {
  final BottleModel bottleItem;
  final VoidCallback onTap;

  const BottleGridItem({
    super.key,
    required this.bottleItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppTheme.cardBackgroundColor,
        elevation: 0,
        clipBehavior: Clip.antiAlias, // Clip image corners if needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
          // Add padding around the content inside the card
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Space for image
                    child: Image.asset(
                      bottleItem?.imageUrl ??
                          'assets/images/bottle.png', // Placeholder image
                      fit: BoxFit.contain, // Fit bottle within the space
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${bottleItem?.distillery} \n${bottleItem?.filled} #${bottleItem?.caskNumber}',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '(${bottleItem?.available}/${bottleItem?.total})',
                style: textTheme.bodySmall?.copyWith(
                  color: AppTheme.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
