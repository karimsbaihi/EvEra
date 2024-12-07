import 'package:evera/components/goBack.dart';
import 'package:flutter/material.dart';
import '../components/colors.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required eventData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Figtree', // Use the Figtree font family
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontWeight: FontWeight.w400), // Regular
          bodyMedium: TextStyle(fontWeight: FontWeight.w500), // Medium
          displayLarge: TextStyle(fontWeight: FontWeight.w700), // Bold
          displayMedium: TextStyle(fontWeight: FontWeight.w800), // ExtraBold
        ),
      ),
      home: Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: mainBlack,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to HomeScreen
          },
        ),
      ),
        body: SingleChildScrollView(
          // Makes the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Info Section
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/photos-gratuite/headstock-touche-classique-bois-ideogramme_1172-289.jpg?semt=ais_hybrid',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "California Art Festival 2023\nDana Point 29-30",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 16.0, color: inputHint),
                              const SizedBox(width: 8.0),
                              Text(
                                "July 31 · 07:30 PM",
                                style: TextStyle(color: inputHint),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "\$39.49",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),

                // Order Summary Section
                const Text(
                  "Order Summary",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white),
                ),
                const SizedBox(height: 12.0),
                Container(
                  decoration: BoxDecoration(
                    color: secondBlack,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      _OrderSummaryRow(
                          label: "1x Regular price", value: "\$35.00"),
                      SizedBox(height: 5),
                      _OrderSummaryRow(label: "Subtotal", value: "\$35.00"),
                      SizedBox(height: 5),
                      _OrderSummaryRow(label: "Fees", value: "\$2.00"),
                      Divider(),
                      _OrderSummaryRow(
                          label: "Total", value: "\$37.00", isBold: true),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),

                // Payment Method Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Payment Method",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle "Change Method" logic
                      },
                      child: Text(
                        "Change Method >",
                        style: TextStyle(
                          color: mainGreen,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Container(
                  decoration: BoxDecoration(
                    color: secondBlack,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.credit_card,
                            size: 32.0,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "EDDAHABIA",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "guechiahmed@gmail.com",
                                style: TextStyle(
                                    color: inputHint,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 1),
                      Image.network(
                        'https://eccp.poste.dz/img/card.png',
                        width: MediaQuery.sizeOf(context).width * 0.2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: secondBlack,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "\$37.00\nRegular x 1",
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0,
                      color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle booking logic
                },
                child: const Text("Book Now"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for Order Summary Row
class _OrderSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _OrderSummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
              color: Colors.white),
        ),
        Text(
          value,
          style: TextStyle(
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
              color: Colors.white),
        ),
      ],
    );
  }
}
