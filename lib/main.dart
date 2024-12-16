import 'package:evera/screens/Home.dart';
import 'package:evera/screens/Login.dart';
import 'package:evera/screens/calendar.dart';
import 'package:evera/screens/linkedAccounts.dart';
import 'package:evera/screens/payment/addPayment.dart';
import 'package:evera/screens/payment/payHistory.dart';
import 'package:evera/screens/payment/payment.dart';
import 'package:evera/screens/payment/removePayment.dart';
import 'package:evera/screens/security/changePass.dart';
import 'package:evera/screens/security/loginActivity.dart';
import 'package:evera/screens/security/security.dart';
import 'package:evera/screens/signup/choosePref.dart';
import 'package:evera/screens/explore.dart';
import 'package:evera/screens/favorites.dart';
import 'package:evera/screens/intro/intro.dart';
import 'package:evera/screens/notifications.dart';
import 'package:evera/screens/personalInfo.dart';
import 'package:evera/screens/profile.dart';
import 'package:evera/screens/signup/signup.dart';
import 'package:evera/screens/signup/signupProfile.dart';
import 'package:evera/screens/splashScreen.dart';
import 'package:evera/screens/ticketCodebar.dart';
import 'package:evera/screens/tickets.dart';
import 'package:evera/styles/colors.dart';
import 'package:evera/screens/ExploreMap.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'confirm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://adgdokcdimmrvrildtiw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFkZ2Rva2NkaW1tcnZyaWxkdGl3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNTc4NDcsImV4cCI6MjA0ODczMzg0N30.gBapb2Eyhi9WSu2VZL8khnI_w8cnug4qLAa4Q2PixpU',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: mainGreen,
          selectionColor: mainGreen.withOpacity(0.3),
          selectionHandleColor: mainGreen,
        ),
    ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/explore' : (context) => const Explore(),
        '/home' : (context) => const Home(),
        '/login' : (context) => const Login(),
        '/intro' : (context) => const Intro(),
        '/tickets': (context) =>const Tickets(),
        '/favorites': (context) =>const Favorites(),
        '/profile': (context) =>const Profile(),
        '/confirm': (context) =>const Confirm(),
        '/notifications': (context) =>const Notifications(),

        '/description2': (context) =>const Description2(),
        '/description3': (context) =>const Description3(),

        '/signup1' : (context) => const SignUpProfile(),
        '/signup2' : (context) => const SignUp(),
        '/choosePref': (context) =>const Prefs(),

        '/calendar': (context) =>const CalendarPage(),

        '/personalInfo': (context) =>const PersonalInfoPage(),
        '/linkedAcc': (context) =>const LinkedAccountsPage(),

        '/security': (context) =>const SecurityPage(),
        '/changePass': (context) =>const ChangePasswordPage(),
        '/loginActivity': (context) =>const LoginActivityPage(),

        '/payment': (context) =>const PaymentPage(),
        '/addPayment': (context) =>const AddPaymentPage(),
        '/removePayment': (context) =>const RemovePaymentPage(),
        '/payHistory': (context) =>const PayHistoryPage(),

        '/ticketDetails': (context) =>const TicketCodeBar(),
        '/exploreMap': (context) =>const ExploreMap(),


      },
      home:   const Splashscreen(),
    );
  }
}
