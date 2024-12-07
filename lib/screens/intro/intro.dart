
import 'package:evera/screens/intro/description1.dart';
import 'package:flutter/material.dart';

import 'description2.dart';
import 'description3.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  static PageController pageController = PageController(
    initialPage:0,
  );

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: Intro.pageController,
        // onPageChanged: (index) {
        //   setState(() {}); // This will reload all child widgets !
        // },
        children: const [Description1(), Description2(), Description3()],
      ),
    );
  }
}
