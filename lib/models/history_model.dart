class History {
  final String? label;
  final String? title;
  final String? heading;
  final String? description;
  final List<String>? attachments;

  History({
    this.label,
    this.title,
    this.heading,
    this.description,
    this.attachments,
  });

  factory History.fromJson(Map<String, dynamic>? json) {
    return History(
      label: json?['label'],
      title: json?['title'],
      heading: json?['heading'],
      description: json?['description'],
      attachments: (json?['attachments'] as List<dynamic>?)
          ?.map((attachment) => attachment.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'title': title,
      'heading': heading,
      'description': description,
      'attachments': attachments,
    };
  }
}
