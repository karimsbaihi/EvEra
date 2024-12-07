import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle errorStyle=TextStyle();

InputDecoration InputDeco(hint){
  return InputDecoration(
    hintText: hint,
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
  );
}


