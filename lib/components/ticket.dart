

import 'package:flutter/material.dart';

import '../styles/colors.dart';
import 'cutTicket.dart';

class Ticket extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String time;

  const Ticket({super.key,required this.image, required this.title, required this.location, required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/ticketDetails');
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.82,
        height: MediaQuery.sizeOf(context).height * 0.2,
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),

        decoration: BoxDecoration(
          color: secondBlack,
          borderRadius: BorderRadius.circular(17),
        ),
        // padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
              leading: SizedBox(
                height:MediaQuery.sizeOf(context).width * 0.18,
                width:MediaQuery.sizeOf(context).width * 0.18,
                child: FittedBox(fit:BoxFit.cover,child: Image.asset(image)),
              ),
              title: Text(title,style: const TextStyle(fontSize:15,color: Colors.white,fontWeight: FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis,),
            ),
            const CutTicket(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Time",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 9,color: thirdBlack),),
                      Text(time,style: const TextStyle(fontSize: 11,color: Colors.white,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Location",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 9,color: thirdBlack),),
                      Text(location,style: const TextStyle(fontSize: 11,color: Colors.white,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainBlack
                    ),
                    child: const Text("Premium ticket x1",style: TextStyle(fontSize: 9,color: Colors.white,fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
