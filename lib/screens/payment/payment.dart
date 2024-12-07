import 'package:evera/screens/payment/payHistory.dart';
import 'package:flutter/material.dart';
import '../../components/goBack.dart';
import '../../styles/colors.dart';
import 'addPayment.dart';
import 'removePayment.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
        centerTitle: true,
        backgroundColor: mainBlack,
        leading: (Navigator.canPop(context)?goBack():null),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage your payment methods:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            _buildPaymentOption(
              icon: Icons.credit_card,
              title: 'Add Payment Method',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPaymentPage()),
                );
              },
            ),
            Divider(color: thirdBlack, thickness: 1),
            _buildPaymentOption(
              icon: Icons.payment,
              title: 'Payment History',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PayHistoryPage()),
                );
              },
            ),
            Divider(color: thirdBlack, thickness: 1),
            _buildPaymentOption(
              icon: Icons.remove_circle,
              title: 'Remove Payment Method',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RemovePaymentPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: mainGreen),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 18,
      ),
      onTap: onTap,
    );
  }
}
