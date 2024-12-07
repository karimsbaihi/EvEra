import 'package:evera/components/ticketBarCode.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../styles/colors.dart';

class TicketCodeBar extends StatelessWidget {
  const TicketCodeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        backgroundColor: mainBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Get a Ticket',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: TicketWidget(
                eventImage: 'assets/ticketbarcode.png',
                eventName: "California Art Festival 2023 Dana Point 29-30",
                date: "March 19, 2023",
                time: "10:00 AM - 12:00 AM",
                ticketSet: "Regular x1",
                venue: "The Living",
                barcodeImage: 'assets/codebar.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var status = await Permission.storage.request();
                    if (status.isGranted) {
                      print("Permission granted");
                    } else {
                      print("Permission denied");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainGreen,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "Download Image",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    "Share QR",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: thirdBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
