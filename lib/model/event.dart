class Event {
  final String? id;
  final String? title;
  final String? thumbnailUrl;
  final String? description;

  Event({this.id, this.title, this.thumbnailUrl, this.description});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      description: json['description'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
