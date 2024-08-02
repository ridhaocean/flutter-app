import 'package:equatable/equatable.dart';

class EventResponse implements Equatable {
  final String responseCode;
  final String responseMessage;
  final EventData data;

  EventResponse({
    required this.responseCode,
    required this.responseMessage,
    required this.data,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      data: EventData.fromJson(json['data']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [responseCode, responseMessage, data];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}

class Event implements Equatable {
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

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, thumbnailUrl, description];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}

class EventData implements Equatable {
  final List<Event> items;
  final int count;

  EventData({
    required this.items,
    required this.count,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    var itemsJson = json['items'] as List;
    List<Event> itemsList =
        itemsJson.map((item) => Event.fromJson(item)).toList();

    return EventData(
      items: itemsList,
      count: json['count'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [items, count];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
