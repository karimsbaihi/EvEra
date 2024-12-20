/*
AUTH GATE - it will continuously listen for the auth state changes

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

unauthenticated -> Login page
authenticated -> profile page


*/

import 'package:evera/screens/Home.dart';
import 'package:evera/screens/Login.dart';  
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Listen to the auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Error state handling
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return Home(); // Authenticated state -> Home screen
        } else {
          return Login(); // Unauthenticated state -> Login screen
        }
      },
    );
  }
}
