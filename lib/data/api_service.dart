import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/event.dart';
import '../model/user.dart';

class ApiService {
  final String userEndpoint =
      'https://run.mocky.io/v3/96ab8118-9f60-492a-b508-a848dfe2b962';
  final String homeEndpoint =
      'https://run.mocky.io/v3/4cd92041-25f2-478f-a05e-b01e84c7dda6';

  Future<http.Response> fetchEvents() async {
    final response = await http.get(Uri.parse(homeEndpoint));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse(userEndpoint));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final responseData = UserResponse.fromJson(jsonResponse);
      return responseData.user;
    } else {
      throw Exception('Failed to load user');
    }
  }

  EventResponse parseEventResponse(http.Response response) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    return EventResponse.fromJson(jsonResponse);
  }
}
