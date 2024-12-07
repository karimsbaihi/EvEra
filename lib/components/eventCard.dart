import 'package:evera/models/ticket.dart';
import 'package:flutter/material.dart';

import '../models/event.dart';
import '../styles/colors.dart';

class EventCard extends StatefulWidget {
  bool favorite;
  final Event evnt;
  final VoidCallback? onTap;
  EventCard({super.key, this.favorite = false, required this.evnt, this.onTap});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        color: secondBlack,
        elevation: 4, // Shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height *
                0.12, // Set a fixed height for the image
            // width: MediaQuery.sizeOf(context).height*0.12,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Aligns items at the start
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FittedBox(
                    child: Image.network(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.width * 0.25,
                      widget.evnt.imageUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 15), // Space between image and text
                // Details section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Title
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Text(
                              widget.evnt.title,
                              maxLines: 2,
                              // softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          // Spacer(),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                  onTap: () {
                                    widget.favorite = !widget.favorite;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    (widget.favorite
                                        ? Icons.favorite
                                        : Icons.favorite_border),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 8), // Space between title and date/price
                      // Row for date and price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Date
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: thirdBlack,
                                  size: 15,
                                ),
                                Text(
                                  "  ${widget.evnt.date}, ${widget.evnt.startTime}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: thirdBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Price
                          // Text(
                          //   "\$39.49   ",
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
