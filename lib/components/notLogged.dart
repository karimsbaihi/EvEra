import 'package:flutter/material.dart';

import '../styles/colors.dart';

class NotLogged extends StatelessWidget {
  const NotLogged({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You are not logged",style: TextStyle(color: inputHint,fontSize: 24),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2,
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
        ],
      ),
    );
  }
}
