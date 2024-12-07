import 'package:flutter/material.dart';
import '../styles/colors.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = "Karim Sbaihi";
    _emailController.text = "karimsbaihi@gmail.com";
    _phoneController.text = "+213 123 456 789";
    _addressController.text = "Algiers, Algeria";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text('Personal Information', style: TextStyle(color: Colors.white, fontFamily: 'Inter')),
          centerTitle: true,
          backgroundColor: mainBlack,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            const Text(
              'Update your details below:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField('Full Name', _nameController, Icons.person),
            const SizedBox(height: 15),
            _buildTextField('Email', _emailController, Icons.email),
            const SizedBox(height: 15),
            _buildTextField('Phone', _phoneController, Icons.phone),
            const SizedBox(height: 15),
            _buildTextField('Address', _addressController, Icons.home),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Details updated successfully!'),
                    ),
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
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: inputHint, fontFamily: 'Inter'),
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
