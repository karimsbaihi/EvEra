import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';

class PayHistoryPage extends StatelessWidget {
  const PayHistoryPage({super.key});

  static const List<Map<String, String>> paymentHistory = [
    {
      'date': '2024-12-01',
      'amount': '500.00 DZD',
      'status': 'Completed',
    },
    {
      'date': '2024-11-25',
      'amount': '300.00 DZD',
      'status': 'Pending',
    },
    {
      'date': '2024-11-18',
      'amount': '750.00 DZD',
      'status': 'Failed',
    },
    {
      'date': '2024-11-10',
      'amount': '1200.00 DZD',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: const Text(
          'Payment History',
          style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
        centerTitle: true,
        backgroundColor: mainBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: paymentHistory.length,
        itemBuilder: (context, index) {
          final payment = paymentHistory[index];
          return Card(
            color: secondBlack,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: Icon(Icons.payment, color: mainGreen),
              title: Text(
                'Amount: ${payment['amount']}',
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Inter', fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date: ${payment['date']}',
                    style: TextStyle(
                        color: inputHint, fontFamily: 'Inter', fontSize: 14),
                  ),
                  Text(
                    'Status: ${payment['status']}',
                    style: TextStyle(
                        color: payment['status'] == 'Completed'
                            ? Colors.green
                            : payment['status'] == 'Pending'
                                ? Colors.orange
                                : Colors.red,
                        fontFamily: 'Inter',
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
