import 'package:flutter/material.dart';

import '../../../components/goBack.dart';
import '../../../styles/colors.dart';

class LinkedAccountsPage extends StatelessWidget {
  const LinkedAccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> linkedAccounts = [
      {'platform': 'Google', 'email': 'karimsbaihi@gmail.com'},
      {'platform': 'Facebook', 'email': 'karim.fb@facebook.com'},
      {'platform': 'Twitter', 'email': 'karim_twtr@twitter.com'},
    ];

    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: const Text(
          'Linked Accounts',
          style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
        centerTitle: true,
        backgroundColor: mainBlack,
        leading: (Navigator.canPop(context)?goBack():null),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: linkedAccounts.length,
          separatorBuilder: (context, index) => Divider(
            color: thirdBlack,
            thickness: 1,
          ),
          itemBuilder: (context, index) {
            final account = linkedAccounts[index];
            return ListTile(
              leading: Icon(Icons.link, color: mainGreen),
              title: Text(
                account['platform']!,
                style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
              ),
              subtitle: Text(
                account['email']!,
                style: TextStyle(color: inputHint, fontFamily: 'Inter'),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  _showDisconnectDialog(context, account);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _showDisconnectDialog(BuildContext context, Map<String, String> account) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: secondBlack,
          title: Text(
            'Disconnect ${account['platform']}',
            style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
          ),
          content: Text(
            'Are you sure you want to disconnect your ${account['platform']} account?',
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
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${account['platform']} account disconnected!'),
                  ),
                );
              },
              child: const Text(
                'Disconnect',
                style: TextStyle(color: Colors.red, fontFamily: 'Inter'),
              ),
            ),
          ],
        );
      },
    );
  }
}
