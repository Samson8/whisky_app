import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/models/history_model.dart';

class HistoryTabContent extends StatelessWidget {
  final List<History>? historyItems;
  const HistoryTabContent({super.key, this.historyItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor.withOpacity(0.8),
      ),
      margin: const EdgeInsets.all(16.0),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        itemCount: historyItems?.length,
        itemBuilder: (context, index) {
          final item = historyItems?[index];
          return HistoryTimelineItem(
            label: item?.label ?? '',
            title: item?.title ?? '',
            description: item?.description ?? '',
            attachments: item?.attachments ?? [],
            isFirst: index == 0,
            isLast: index == (historyItems?.length ?? 0) - 1,
          );
        },
      ),
    );
  }
}

// --- Widget for a single timeline item ---
class HistoryTimelineItem extends StatelessWidget {
  final String label;
  final String title;
  final String description;
  final List<String> attachments;
  final bool isFirst;
  final bool isLast;

  const HistoryTimelineItem({
    super.key,
    required this.label,
    required this.title,
    required this.description,
    required this.attachments,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      // Ensures Row takes height of its children
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Column (Circle and Line)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Top line (invisible if first item)
              Container(
                width: 1,
                height: 10, // Space above circle
                color: isFirst
                    ? Colors.transparent
                    : AppTheme.primaryColor.withOpacity(0.5),
              ),
              // Circle indicator
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppTheme
                      .backgroundColor, // Background color to punch hole
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.primaryColor, width: 2),
                ),
              ),
              // Bottom line (expands, invisible if last item)
              Expanded(
                child: Container(
                  width: 1,
                  color: isLast
                      ? Colors.transparent
                      : AppTheme.primaryColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),

          // Content Column
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 24.0), // Space between items
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.lato().copyWith(
                        color: AppTheme.subtleTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 4),
                  Text(title,
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.lato().copyWith(
                        color: AppTheme.subtleTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  if (attachments.isNotEmpty) ...[
                    // Conditionally show attachments
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.attachment,
                            size: 16, color: AppTheme.subtleTextColor),
                        const SizedBox(width: 4),
                        Text(
                          'Attachments',
                          style: GoogleFonts.lato().copyWith(
                              color: AppTheme.subtleTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Placeholder for Attachment Thumbnails
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(
                          attachments.length,
                          (i) => Container(
                                width: 60, height: 60,
                                color:
                                    AppTheme.cardBackgroundColor, // Placeholder
                                child: const Icon(Icons.image_outlined,
                                    color: AppTheme.subtleTextColor),
                              )),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
