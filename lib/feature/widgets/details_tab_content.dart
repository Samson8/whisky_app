import 'package:flutter/material.dart';
import 'package:whisky_app/core/theme/theme.dart';

class DetailsTabContent extends StatelessWidget {
  const DetailsTabContent({super.key});

  // Helper widget for consistent row styling
  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: textTheme.bodyMedium
                  ?.copyWith(color: AppTheme.subtleTextColor)),
          Text(value, style: textTheme.bodyMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow(context, 'Distillery', 'Text'),
          _buildDetailRow(context, 'Region', 'Text'),
          _buildDetailRow(context, 'Country', 'Text'),
          _buildDetailRow(context, 'Type', 'Text'),
          _buildDetailRow(context, 'Age statement', 'Text'),
          _buildDetailRow(context, 'Filled', 'Text'),
          _buildDetailRow(context, 'Bottled', 'Text'),
          _buildDetailRow(context, 'Cask number', 'Text'),
          _buildDetailRow(context, 'ABV', 'Text'),
          _buildDetailRow(context, 'Size', 'Text'),
          _buildDetailRow(context, 'Finish', 'Text'),
          // Add more details as needed
        ],
      ),
    );
  }
}
