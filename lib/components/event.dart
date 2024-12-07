
import 'package:evera/models/event.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class EventToExplore extends StatefulWidget {
  final Event event;
  final VoidCallback? onTap;
  const EventToExplore({super.key,required this.event,this.onTap});

  @override
  State<EventToExplore> createState() => _EventToExploreState();
}

class _EventToExploreState extends State<EventToExplore> {

  bool favorite=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        // height: MediaQuery.sizeOf(context).height * 0.3,
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
                borderRadius:BorderRadius.circular(20),
                child: Image.network(widget.event.imageUrl,fit: BoxFit.cover,)
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.topRight,
                      height: constraints.maxHeight * 0.62,
                      child: GestureDetector(
                        onTap: (){
                          favorite=!favorite;
                          setState(() {});
                        },
                        child: Icon(favorite?Icons.favorite:Icons.favorite_border,color: Colors.white,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      width: constraints.maxWidth * 0.95,
                      // height: constraints.maxHeight * 0.4,
                      decoration: BoxDecoration(
                        color: secondBlack,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(widget.event.title,style: const TextStyle(fontSize:15,color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today_outlined,size: 12,color: thirdBlack,),
                                const SizedBox(width: 5,),
                                Text("${widget.event.date}, ${widget.event.startTime}",style: TextStyle(fontSize: 10,color: thirdBlack),),
                                // const Spacer(),
                                // const Text("\$39.49",style: TextStyle(fontSize: 10,color: Colors.white)),
      
                              ],
                              // contentPadding: EdgeInsets.zero,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
