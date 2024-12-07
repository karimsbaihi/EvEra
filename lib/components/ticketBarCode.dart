import 'package:flutter/material.dart';
import 'cutTicket.dart';
import '../styles/colors.dart';

class TicketWidget extends StatelessWidget {
  final String eventImage;
  final String eventName;
  final String date;
  final String time;
  final String ticketSet;
  final String venue;
  final String barcodeImage;

  const TicketWidget({
    super.key,
    required this.eventImage,
    required this.eventName,
    required this.date,
    required this.time,
    required this.ticketSet,
    required this.venue,
    required this.barcodeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: secondBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              eventImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date", style: TextStyle(fontFamily: 'Inter', color: thirdBlack)),
                        const SizedBox(height: 4,),
                        Text(date, style: const TextStyle(fontFamily: 'Inter', color: Colors.white)),
                        const SizedBox(height: 4,),
                        Text("Ticket Set", style: TextStyle(fontFamily: 'Inter', color: thirdBlack)),
                        const SizedBox(height: 4,),
                        Text(ticketSet, style: const TextStyle(fontFamily: 'Inter', color: Colors.white)),
                        const SizedBox(height: 8),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Time", style: TextStyle(fontFamily: 'Inter', color: thirdBlack)),
                        const SizedBox(height: 4,),
                        Text(time, style: const TextStyle(fontFamily: 'Inter', color: Colors.white)),
                        const SizedBox(height: 4,),
                        Text("Venue", style: TextStyle(fontFamily: 'Inter', color: thirdBlack)),
                        const SizedBox(height: 4,),
                        Text(venue, style: const TextStyle(fontFamily: 'Inter', color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: const CutTicket(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: secondBlack,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                barcodeImage,
                height: 80,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
