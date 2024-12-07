

import 'package:flutter/material.dart';


class goBack extends StatelessWidget {
  Color color;
  goBack({super.key,this.color=Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        color: color,
      ),
    );
  }
}



class GoBack extends StatefulWidget {
  const GoBack({super.key});

  @override
  State<GoBack> createState() => _GoBackState();
}

class _GoBackState extends State<GoBack> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    );
  }
}

