import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Confirm extends StatefulWidget {
  const Confirm({super.key});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {


  Future<bool> confirmSignup(String token, String email) async {
    try{
      final AuthResponse res = await Supabase.instance.client.auth.verifyOTP(
        type: OtpType.signup,
        token: token,
        email: email,
      );
    }catch(e,stacktrace){
      return false;
    }
    // print(res.session);
    // print(res.user);

    // if (res. != null) {
      // Handle error
      // print('Error verifying OTP: ${res.error!.message}');
      // return false;
    // } else {
      // OTP verified successfully
      // final Session? session = res.session;
      // final User? user = res.user;

      // Proceed with the next steps, e.g., navigate to the home screen
      return true;
    // }
  }


  TextEditingController controller=TextEditingController();

  var email='';
  @override
  Widget build(BuildContext context) {
    email = (ModalRoute.of(context)?.settings.arguments as Map)['email'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(controller: controller,),
            ElevatedButton(onPressed: () async {
              var confirmed=await confirmSignup(controller.text, email);
              if(confirmed){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                  return const Verified();
                }) ).then((value){
                  Future.delayed(const Duration(seconds: 5),(){
                    Navigator.pushReplacementNamed(context, '/login');
                  });
                });
              }else{
              }
            }, child: const Text('confirm'))
          ],
        ),
      ),
    );
  }
}


class Verified extends StatefulWidget {
  const Verified({super.key});

  @override
  State<Verified> createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("verified"),),
    );
  }
}

