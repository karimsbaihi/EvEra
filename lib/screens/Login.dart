import 'package:evera/authentification/auth_service.dart';
import 'package:evera/styles/colors.dart';
import 'package:evera/components/goBack.dart';
import 'package:flutter/material.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Get auth service instance
  final authService = AuthService();
  final formKey = GlobalKey<FormState>();

  // Text controllers for email and password input fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Login button pressed logic
  void login() async {
    // Prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    // Attempt login via Supabase authentication
    try {
      // Call Supabase signInWithEmailPassword
      final response = await authService.signInWithEmailPassword(email, password);

      if (response.error == null) {
        // If successful, navigate to home page
        var prefs = await SharedPreferences.getInstance();
        prefs.setBool('logged', true); // Optionally save login state
        Navigator.pushNamed(context, '/home');
      } else {
        // If there's an error, display error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error: ${response.error!.message}"),
        ));
      }
    } catch (e) {
      // Catch any other errors and display them
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        leading: (Navigator.canPop(context) ? goBack() : null),
        title: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: mainGreen,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
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
                  "Login",
                  style: TextStyle(fontSize: 42, color: Colors.white),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextFormField(
                          controller: _emailController,
                          onTapOutside: (PointerDownEvent event) {
                            // Remove focus when tapped outside
                            FocusScope.of(context).unfocus();
                          },
                          style: const TextStyle(color: Color(0xffB3B3B3)),
                          cursorColor: mainGreen,
                          decoration: InputDeco('Email')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextFormField(
                          controller: _passwordController,
                          onChanged: (value) {
                            // Optionally handle password change
                          },
                          validator: (value) {},
                          onTapOutside: (PointerDownEvent event) {
                            // Remove focus when tapped outside
                            FocusScope.of(context).unfocus();
                          },
                          style: const TextStyle(color: Color(0xffB3B3B3)),
                          cursorColor: mainGreen,
                          obscureText: true,
                          decoration: InputDeco('Password')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: GestureDetector(
                        onTap: login, // This will now call the login method
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              // Commented-out original sign-up redirection logic
              // const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup1');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("Sign up", style: TextStyle(color: mainGreen)),
                        ],
                      )),
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
