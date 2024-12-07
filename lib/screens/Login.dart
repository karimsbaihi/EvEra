import 'package:evera/styles/colors.dart';
import 'package:evera/components/goBack.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/styles.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();
  String password='';


  @override
  void initState() {
    // init();
    super.initState();
  }

  // void init()async{
  //   prefs = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
    // var first = (ModalRoute.of(context)!.settings.arguments as Map )['first'];
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        leading: (Navigator.canPop(context)?goBack():null),
        title: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/home');
            },
            child: Text("Skip",style: TextStyle(color: mainGreen,),textAlign: TextAlign.right,),
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
                child: Text("Login",style: TextStyle(fontSize: 42,color: Colors.white),),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextFormField(
                        onTapOutside: (PointerDownEvent event) {
                          // Remove focus when tapped outside
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(color: Color(0xffB3B3B3)),
                        cursorColor: mainGreen,
                        decoration: InputDeco('Email')

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextFormField(
                        onChanged: (value){
                          password=value;
                        },
                        validator: (value){

                        },
                        onTapOutside: (PointerDownEvent event) {
                          // Remove focus when tapped outside
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(color: Color(0xffB3B3B3)),
                        cursorColor: mainGreen,
                        obscureText: true,

                        decoration: InputDeco('Password')

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: GestureDetector(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setBool('logged',true);
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        child: Container(
                          // width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 24,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text("Forget Password?",style: TextStyle(color: Colors.white),),
                    ),

                  ],
                ),
              ),
              // const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/signup1');
                      },
                      child: const Text("Don't have an account? Sign up",style: TextStyle(color: Colors.white),)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
