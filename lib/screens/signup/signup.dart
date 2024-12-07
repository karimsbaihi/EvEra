import 'package:evera/styles/colors.dart';
import 'package:evera/components/goBack.dart';
import 'package:flutter/material.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final formKey = GlobalKey<FormState>();
  String password='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        leading: goBack(),
        // title: Align(
        //   alignment: Alignment.centerRight,
        //   child: GestureDetector(
        //     child: Text("Skip",style: TextStyle(color: mainGreen,),textAlign: TextAlign.right,),
        //   ),
        // ),
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
                child: Text("Set Up Your Password",style: TextStyle(fontSize: 38,color: Colors.white),),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        onChanged: (value){
                          password=value;
                        },
                        validator: (value){
                          if(value == null || value == ''){
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onTapOutside: (PointerDownEvent event) {
                          // Remove focus when tapped outside
                          FocusScope.of(context).unfocus();
                        },
                        obscureText: true,
                        style: const TextStyle(color: Color(0xffB3B3B3)),
                        cursorColor: mainGreen,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 16,color: inputHint),
                          filled: true,
                          fillColor: secondBlack,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: mainGreen,width: 1.5)
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        onTapOutside: (PointerDownEvent event) {
                          // Remove focus when tapped outside
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(color: Color(0xffB3B3B3)),
                        cursorColor: mainGreen,
                        obscureText: true,
                          validator: (value){
                            if(value == null || value == ''){
                              return 'Please confirm the password';
                            }
                            if(value!=password){
                              return 'Passwords does not match';
                            }
                            return null;
                          },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(fontSize: 16,color: inputHint),
                          filled: true,
                          fillColor: secondBlack,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: mainGreen,width: 1.5)
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: GestureDetector(
                        onTap: (){
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Navigator.pushNamed(context, '/choosePref');
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
                              "Continue",
                              style: TextStyle(fontSize: 24,color: Colors.white),
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
