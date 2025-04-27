class History {
  final String label;
  final String title;
  final String heading;
  final String description;

  History({
    required this.label,
    required this.title,
    required this.heading,
    required this.description,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      label: json['label'],
      title: json['title'],
      heading: json['heading'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'title': title,
      'heading': heading,
      'description': description,
    };
  }
}
