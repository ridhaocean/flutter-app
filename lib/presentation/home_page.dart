import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../manager/event_cubit.dart';
import '../manager/event_state.dart';
import '../route/routes.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch events when the page is initialized
    context.read<EventCubit>().fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'images/logo-troops.png',
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    const Text(
                      'Halo, User',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    PopupMenuButton<String>(
                      onSelected: (String result) {
                        if (result == 'logout') {
                          QR.replace(AppRoutes.homePath, AppRoutes.loginPath);
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'logout',
                          child: Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: const Text('Log out',
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                      ],
                      offset: const Offset(0, 40),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('images/logo-troops.png'),
                        radius: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: BlocBuilder<EventCubit, EventState>(
          builder: (context, state) {
            if (state is EventLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is EventLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<EventCubit>().fetchEvents();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 216,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('images/ocean-mengajar.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Newsfeed',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.eventResponse.data.items.length,
                          itemBuilder: (context, index) {
                            final event = state.eventResponse.data.items[index];
                            return InkWell(
                              onTap: () {
                                // Convert the event object to a JSON string
                                final eventJson = jsonEncode(event.toJson());
                                QR.toName(AppRoutes.detailRouteName,
                                    params: {'event': eventJson});
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 16),
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                      child: Image.asset(
                                        event.thumbnailUrl ??
                                            'images/ocean-mengajar.png',
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      event.title ?? "Ocean Mengajar",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is EventError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('General Error'));
          },
        ));
  }
}
