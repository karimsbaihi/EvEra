import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/notifications');
      },
        child: const Icon(Icons.notifications_active_outlined,color: Colors.white,)
    );
  }
}
