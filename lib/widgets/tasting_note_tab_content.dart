import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/feature/home/presentation/bloc/collection_bloc.dart';
import 'package:whisky_app/models/tasting_model.dart';

class TastingNotesTabContent extends StatelessWidget {
  final TastingNote? tastingNotes;
  final TastingNote? authorTastingNotes;
  final String? bottleId;
  const TastingNotesTabContent(
      {super.key, this.tastingNotes, this.authorTastingNotes, this.bottleId});

  // Helper for tasting note sections
  Widget _buildTastingSection(
      BuildContext context, String title, String? description1) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.plainBackgroundColor,
      ),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(
              description1 ?? 'N/A',
              style: GoogleFonts.lato().copyWith(
                  color: AppTheme.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
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
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'by ${authorTastingNotes?.userName ?? 'N/A'}',
            style: GoogleFonts.lato().copyWith(
                color: AppTheme.subtleTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 16),

          _buildTastingSection(context, 'Nose', authorTastingNotes?.noseRemark),
          _buildTastingSection(
              context, 'Palate', authorTastingNotes?.palateRemark),
          _buildTastingSection(
              context, 'Finish', authorTastingNotes?.finishRemark),

          const SizedBox(height: 24),
          const Divider(color: AppTheme.subtleTextColor),
          const SizedBox(height: 16),

          // Your Notes Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your notes',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined,
                    color: AppTheme.primaryColor),
                tooltip: 'Edit Notes',
                onPressed: () {
                  showUpdateTastingNoteModal(context, tastingNotes,
                      (updatedNote) {
                    context
                        .read<CollectionBloc>()
                        .saveTastingNote(updatedNote, bottleId ?? '');
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 16),
          _buildTastingSection(context, 'Nose', tastingNotes?.noseRemark),
          _buildTastingSection(context, 'Palate', tastingNotes?.palateRemark),
          _buildTastingSection(context, 'Finish', tastingNotes?.finishRemark),
        ],
      ),
    );
  }
}

Future<void> showUpdateTastingNoteModal(BuildContext context,
    TastingNote? tastingNote, Function(TastingNote) onSave) async {
  final TextEditingController noseController =
      TextEditingController(text: tastingNote?.noseRemark ?? '');
  final TextEditingController palateController =
      TextEditingController(text: tastingNote?.palateRemark ?? '');
  final TextEditingController finishController =
      TextEditingController(text: tastingNote?.finishRemark ?? '');

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppTheme.cardBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Edit Your Tasting Notes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: noseController,
              decoration: InputDecoration(labelText: 'Nose Remark'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: palateController,
              decoration: InputDecoration(labelText: 'Palate Remark'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: finishController,
              decoration: InputDecoration(labelText: 'Finish Remark'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedNote = TastingNote(
                  userName: tastingNote?.userName, // Keep existing userName
                  noseRemark: noseController.text,
                  palateRemark: palateController.text,
                  finishRemark: finishController.text,
                );
                onSave(updatedNote);
                Navigator.of(context).pop();
              },
              child: Text('Save Changes'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
