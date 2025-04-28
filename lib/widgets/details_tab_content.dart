import 'package:flutter/material.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/models/bottle_model.dart';

class DetailsTabContent extends StatelessWidget {
  final BottleModel? bottle;
  const DetailsTabContent({super.key, this.bottle});

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
          _buildDetailRow(context, 'Distillery', bottle?.distillery ?? 'N/A'),
          _buildDetailRow(context, 'Region', bottle?.region ?? 'N/A'),
          _buildDetailRow(context, 'Country', bottle?.country ?? 'N/A'),
          _buildDetailRow(context, 'Type', bottle?.type ?? 'N/A'),
          _buildDetailRow(
              context, 'Age statement', bottle?.ageStatement ?? 'N/A'),
          _buildDetailRow(context, 'Filled', bottle?.filled ?? 'N/A'),
          _buildDetailRow(context, 'Bottled', bottle?.bottled ?? 'N/A'),
          _buildDetailRow(context, 'Cask number', bottle?.caskNumber ?? 'N/A'),
          _buildDetailRow(context, 'ABV', bottle?.abv ?? 'N/A'),
          _buildDetailRow(context, 'Size', bottle?.cask ?? 'N/A'),
          _buildDetailRow(context, 'Finish', bottle?.finish ?? 'N/A'),
        ],
      ),
    );
  }
}
