import 'package:flutter/material.dart';
import 'package:whisky_app/core/theme/theme.dart';

class TastingNotesTabContent extends StatelessWidget {
  const TastingNotesTabContent({super.key});

  // Helper for tasting note sections
  Widget _buildTastingSection(BuildContext context, String title,
      String description1, String description2) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(description1,
              style: textTheme.bodyMedium
                  ?.copyWith(color: AppTheme.subtleTextColor)),
          Text(description2,
              style: textTheme.bodyMedium
                  ?.copyWith(color: AppTheme.subtleTextColor)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Placeholder
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black54, // Placeholder color
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  color: AppTheme.textColor,
                  size: 50,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Official Tasting Notes
          Text(
            'Tasting notes',
            style: textTheme.displaySmall
                ?.copyWith(fontFamily: 'SerifFont', fontSize: 20),
          ),
          Text(
            'by Charles MacLean MBE', // Example author
            style: textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          _buildTastingSection(context, 'Nose', 'Description', 'Description'),
          _buildTastingSection(context, 'Palate', 'Description', 'Description'),
          _buildTastingSection(context, 'Finish', 'Description', 'Description'),

          const SizedBox(height: 24),
          const Divider(color: AppTheme.subtleTextColor),
          const SizedBox(height: 16),

          // Your Notes Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your notes',
                style: textTheme.displaySmall
                    ?.copyWith(fontFamily: 'SerifFont', fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined,
                    color: AppTheme.primaryColor),
                tooltip: 'Edit Notes',
                onPressed: () {
                  // TODO: Implement edit notes action
                },
              )
            ],
          ),
          const SizedBox(height: 16),
          _buildTastingSection(context, 'Nose', 'Description', 'Description'),
          _buildTastingSection(context, 'Palate', 'Description', 'Description'),
          _buildTastingSection(context, 'Finish', 'Description', 'Description'),
        ],
      ),
    );
  }
}
