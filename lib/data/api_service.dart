import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/event.dart';

class ApiService {
  final String endpoint =
      'https://run.mocky.io/v3/cef846f9-3b14-4371-9dd0-6108e845534b';

  Future<http.Response> fetchEvents() async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load events');
    }
  }

  EventResponse parseEventResponse(http.Response response) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    return EventResponse.fromJson(jsonResponse);
  }
}
