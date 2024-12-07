
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class BottomBar extends StatefulWidget {
  final int currentIndex;
  const BottomBar({super.key, required this.currentIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  List<IconData> icons=[Icons.home_outlined,Icons.search,Icons.confirmation_num_outlined,Icons.favorite_border,Icons.person_2];

  void changeScreen(int index){
    if(index!=widget.currentIndex){
      List<String> screens=['/home','/explore','/tickets','/favorites','/profile'];
      if(widget.currentIndex==0){
        Navigator.pushNamed(context, screens[index]);
      }
      if(index==0){
        Navigator.pop(context);
      }
      Navigator.pushReplacementNamed(context,screens[index]);
    }
  }

  Widget createIcon(IconData icon,int index){

    Color iconColor=inputHint;
    Color backgroundColor=Colors.transparent;

    if(index==widget.currentIndex){
      iconColor=Colors.white;
      backgroundColor=mainGreen;
    }


    return GestureDetector(
      onTap: () => changeScreen(index),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.13,
        height: MediaQuery.sizeOf(context).width * 0.13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor,
        ),
        child: Icon(icon,color: iconColor,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: MediaQuery.sizeOf(context).height * 0.08,
      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
      color: secondBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for(int i=0;i<5;i++)
            createIcon(icons[i], i)
        ],
      )
    );
  }
}
