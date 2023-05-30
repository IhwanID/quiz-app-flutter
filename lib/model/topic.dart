class Topic {
  String title;

  Topic({
    required this.title,
  });

  dynamic toJson() => {
        'title': title,
      };

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      title: json['title'],
    );
  }
}
