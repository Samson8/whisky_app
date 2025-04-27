class TastingNote {
  final String userNote;

  TastingNote({
    required this.userNote,
  });

  factory TastingNote.fromJson(Map<String, dynamic> json) {
    return TastingNote(
      userNote: json['userNotes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userNotes': userNote,
    };
  }
}
