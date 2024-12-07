import 'package:flutter/material.dart';
import 'package:evera/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {

  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init()async{
    var prefs = await SharedPreferences.getInstance();
    var first = prefs.getBool('first');
    prefs.setBool('logged', false);
    print(first);
    await Future.delayed(const Duration(seconds: 2),(){});
    if(first==null){
      prefs.setBool('first', false);
      Navigator.pushReplacementNamed(context, '/intro');
    }else{
      Navigator.pushReplacementNamed(context, '/login',arguments: {'first':false});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      body: Center(
        child: Row(
          children: [
            Image.asset('assets/logo.png'),
            Image.asset('assets/logo1.png',width: MediaQuery.sizeOf(context).width*0.5,),
          ],
        ),
      ),
    );
  }
}
