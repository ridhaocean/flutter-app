import 'package:flutter/material.dart';
import '../model/event.dart';

class HomePage extends StatelessWidget {
  final List<Event> events = [
    Event(
        id: "1",
        title: "GROWTH MINDSET AND THE POWER OF FEEDBACK",
        thumbnailUrl: "images/om-growth.png",
        description:
            "Date: Jumat, 5 Juli 2024 Time: 15.30 - 17.30 WIB Media: Live Zoom Meeting GRATIS Speaker: Nadhifa Sofia - Senior Product Owner Ocean Innovation Additional Fee Rp30.000 for more benefits"),
    Event(
        id: "2",
        title: "Software Architecture for Beginner",
        thumbnailUrl: "images/om-arch.png",
        description:
            "Yuk, Ikuti Kelas Ocean Mengajar! Belajar Software Architecture dari Nol bersama Pak Rusdiana, CTO Ocean Innovation. Gratis! Tanggal: Jumat, 03 Mei 2024. Waktu: 15:30-17:30 Link Pendaftaran: bit.ly/OceanMengajar"
            "Segera Daftar di Link yang Tersedia. Jangan Sampai Ketinggalan!"),
    Event(
        id: "3",
        title: "Implementation Unit Testing In GO With Testify",
        thumbnailUrl: "images/om-testify.png",
        description:
            "Kali ini kita akan bahas topik \"Implentation Unit Testing In Go With Testify\" yang akan disampaikan langsung oleh expert kita Tiar Agisti, Senior Backend Developer\nHari & Tanggal : Jumat, 14 Juni 2024 Pukul: 15.30 - 17.30 WIB Link Pendaftaran: bit.ly/OceanMengajar-2"),
    Event(
        id: "4",
        title: "Flutter for Everyone",
        thumbnailUrl: "images/om-flutter.png",
        description:
            "Flutter for Everyone Ridha Danjanny - Android Developer at Ocean Innovation Date: Friday, 2nd August 2024 Time: 15.30 - 17.30 WIB Don't miss out on this chance to elevate your skills and dive into the world of Flutter development. Reserve your spot today and be part of an enriching learning experience!")
  ];

  HomePage({super.key});

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
                    // Replace with your logo asset path
                    height: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Halo, User',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/logo-troops.png'),
                    // Replace with your profile image asset path
                    radius: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                    // Replace with your image asset path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Newsfeed',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Container(
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
                            event.thumbnailUrl ?? 'images/ocean-mengajar.png',
                            // Replace with your thumbnail image asset path
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
