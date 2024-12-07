import 'package:flutter/material.dart';
import '../components/notificationsCard.dart';
import '../styles/colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        backgroundColor: mainBlack,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return NotificationCard(
            title: index % 2 == 0 ? 'Booking successful' : 'New Session Available',
            date: '30 July 2023 | 10:00 AM - 12:00 AM',
            message: 'You have successfully booked the art workshop. The event will be held on Sunday 30 July at Sangrut. The living Venue. Timing is 10:00 AM - 12:00 AM. Don’t forget to activate your reminder. Enjoy the event!',
          );
        },
      ),
    );
  }
}
