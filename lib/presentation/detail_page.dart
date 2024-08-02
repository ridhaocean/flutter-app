import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/model/event.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the event JSON string parameter
    final eventParam = QR.params['event']!;

    // Convert ParamValue to String
    final eventJson = eventParam.toString();

    // Deserialize the JSON string back to a map
    final eventMap = jsonDecode(eventJson) as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          eventMap['title'] ?? 'Detail',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        leading: BackButton(
          onPressed: () {
            QR.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (eventMap['thumbnailUrl'] != null)
            Image.asset(
              eventMap['thumbnailUrl'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventMap['title'] ?? 'No Title',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  eventMap['description'] ?? 'No Description',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
