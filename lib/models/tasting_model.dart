class TastingNote {
  final String? userName;
  final String? noseRemark;
  final String? palateRemark;
  final String? finishRemark;

  TastingNote({
    this.userName,
    this.noseRemark,
    this.palateRemark,
    this.finishRemark,
  });

  factory TastingNote.fromJson(Map<String, dynamic>? json) {
    return TastingNote(
      userName: json?['userName'],
      noseRemark: json?['noseRemark'],
      palateRemark: json?['palateRemark'],
      finishRemark: json?['finishRemark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'noseRemark': noseRemark,
      'palateRemark': palateRemark,
      'finishRemark': finishRemark,
    };
  }
}
