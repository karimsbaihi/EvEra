import 'package:evera/models/event.dart';
import 'package:flutter/material.dart';
// import '../components/colors.dart';
import '../components/eventCard.dart';
import '../styles/colors.dart';

class OrganizerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/org.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset((MediaQuery.of(context).size.width / 2) - (50), 150),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/karim.png'),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Text(
            'World of Music',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Organizer',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                    ),
                    child: const Text('Follow', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 9,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                    ),
                    child: const Text('Message', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: mainGreen,
                    labelColor: Colors.white,
                    unselectedLabelColor: secondBlack,
                    tabs: [
                      const Tab(text: 'Events'),
                      const Tab(text: 'Collections'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildEventList(),
                        const Center(
                          child: Text(
                            'No collections available',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: EventCard(evnt: const Event(id: 1, title: '', description: 'description', place: 'place', date: 'date', startTime: 'startTime', endTime: 'endTime', type: 'type', imageUrl: 'https://adgdokcdimmrvrildtiw.supabase.co/storage/v1/object/sign/files/guitar.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJmaWxlcy9ndWl0YXIucG5nIiwiaWF0IjoxNzMzNTEzMDU4LCJleHAiOjE3MzYxMDUwNTh9._HpifnRUJMIACSCiefDtTfS0--lSdWmT2SGeHUqKLQM&t=2024-12-06T19%3A24%3A15.180Z'),),
        );
      },
    );
  }
}
