import 'package:evera/styles/colors.dart';
import 'package:evera/components/goBack.dart';
import 'package:flutter/material.dart';
import 'package:evera/authentification/auth_service.dart';
import 'package:gotrue/src/types/auth_response.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // get auth service
  final authService = AuthService();
  final formKey = GlobalKey<FormState>();

  // text controllers
  String? email;
  String password = '';
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

void signUp(String? email) async {
  print("Email received in signUp method: $email");  // <-- Debugging statement
  
  if (email == null || email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email')));
    return;
  }

  final password = _passwordController.text;
  final confirmPassword = _confirmpasswordController.text;
  
  try {
    final response = await authService.signUpWithEmailPassword(email, password);
    if (response.error == null) {
      print("Signup successful!");  // <-- Debugging statement
      Navigator.pushNamed(context, '/choosePref');
    } else {
      print("Signup failed: ${response.error!.message}");  // <-- Debugging statement
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.error!.message}')));
    }
  } catch (e) {
    print("Error during signup: $e");  // <-- Debugging statement
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')));
  }
}


@override
void didChangeDependencies() {
  super.didChangeDependencies();
  final passedEmail = ModalRoute.of(context)?.settings.arguments as String?;
  print("Passed email: $passedEmail");  // <-- Debugging statement
  if (passedEmail != null) {
    email = passedEmail;
    print("Assigned email: $email");  // <-- Debugging statement
  } else {
    // Handle case where email is not passed or null
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email not passed or invalid')));
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        leading: goBack(),
        backgroundColor: mainBlack,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 33, 15, 70),
                child: Text(
                  "Set Up Your Password",
                  style: TextStyle(fontSize: 38, color: Colors.white),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        controller: _passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(color: Color(0xffB3B3B3)),
                        cursorColor: mainGreen,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 16, color: inputHint),
                          filled: true,
                          fillColor: secondBlack,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(color: mainGreen, width: 1.5)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        controller: _confirmpasswordController,
                        style: const TextStyle(color: Color(0xffB3B3B3)),
                        cursorColor: mainGreen,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Please confirm the password';
                          }
                          if (value != password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(fontSize: 16, color: inputHint),
                          filled: true,
                          fillColor: secondBlack,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(color: mainGreen, width: 1.5)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if (email != null) {
                              signUp(email!);
                            }
                          }
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on AuthResponse {
  get error => null;
}
