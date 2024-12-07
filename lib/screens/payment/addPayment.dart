import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({Key? key}) : super(key: key);

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  // final TextEditingController _ibanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: const Text(
          'Add Payment Method',
          style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
        centerTitle: true,
        backgroundColor: mainBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your payment card details:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField('Cardholder Name', _cardHolderController, Icons.person),
            const SizedBox(height: 15),
            _buildTextField('Card Number (16 digits)', _cardNumberController, Icons.credit_card),
            const SizedBox(height: 15),
            _buildTextField('Expiration Date (MM/YY)', _expiryDateController, Icons.date_range),
            const SizedBox(height: 15),
            _buildTextField('CVV (3 digits)', _cvvController, Icons.lock),
            const SizedBox(height: 20),
            _buildTextField('Bank Name', _bankNameController, Icons.business),
            // const SizedBox(height: 15),
            // _buildTextField('IBAN (International Bank Account Number)', _ibanController, Icons.account_balance),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add payment logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment method added!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 50,
                  ),
                ),
                child: const Text(
                  'Add Payment Method',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: inputHint),
        prefixIcon: Icon(icon, color: inputHint),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondBlack),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: mainGreen),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: secondBlack,
      ),
    );
  }
}
