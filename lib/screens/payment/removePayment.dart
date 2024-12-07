import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class RemovePaymentPage extends StatelessWidget {
  const RemovePaymentPage({super.key});

  static const List<Map<String, String>> paymentMethods = [
    {'cardType': 'Visa', 'lastFour': '1234'},
    {'cardType': 'MasterCard', 'lastFour': '5678'},
    {'cardType': 'Eddahabia', 'lastFour': '9876'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: const Text(
          'Remove Payment Method',
          style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
        centerTitle: true,
        backgroundColor: mainBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.separated(
        itemCount: paymentMethods.length,
        separatorBuilder: (context, index) => Divider(color: thirdBlack),
        itemBuilder: (context, index) {
          final method = paymentMethods[index];
          return ListTile(
            leading: Icon(Icons.credit_card, color: mainGreen),
            title: Text(
              '${method['cardType']} •••• ${method['lastFour']}',
              style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showRemoveDialog(context, method);
              },
            ),
          );
        },
      ),
    );
  }

  void _showRemoveDialog(BuildContext context, Map<String, String> method) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: secondBlack,
          title: Text(
            'Remove ${method['cardType']} ending in ${method['lastFour']}?',
            style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
          ),
          content: Text(
            'Are you sure you want to remove this payment method?',
            style: TextStyle(color: inputHint, fontFamily: 'Inter'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: mainGreen, fontFamily: 'Inter'),
              ),
            ),
            TextButton(
              onPressed: () {
                // Remove payment method logic here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${method['cardType']} ending in ${method['lastFour']} removed!'),
                  ),
                );
              },
              child: const Text(
                'Remove',
                style: TextStyle(color: Colors.red, fontFamily: 'Inter'),
              ),
            ),
          ],
        );
      },
    );
  }
}
