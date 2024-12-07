import 'package:evera/components/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/notLogged.dart';
import '../components/notificationIcon.dart';
import '../styles/colors.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});


  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomBar(currentIndex: 2),
      backgroundColor: mainBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
          child: FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return CircularProgressIndicator();
                }else{
                  bool? logged=snapshot.data?.getBool('logged');
                  if(logged!=null){
                    if(logged){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text widget before the DefaultTabController
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text("Your"),
                            titleTextStyle: TextStyle(fontSize: 15,color: inputHint),
                            subtitle: const Text("Tickets"),
                            subtitleTextStyle: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),
                            trailing: const NotificationIcon(),
                          ),
                          // DefaultTabController
                          Expanded(
                            child: DefaultTabController(
                              length: 3, // Number of tabs
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    color: mainBlack, // Background color for the tab bar
                                    child: TabBar(
                                      // indicatorPadding: EdgeInsets.zero,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      dividerColor: thirdBlack,
                                      indicatorColor: Colors.white,
                                      labelColor: Colors.white,
                                      unselectedLabelColor: thirdBlack,
                                      labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                                      unselectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                                      tabs: const [
                                        Tab(text: 'Upcoming'),
                                        Tab(text: 'Completed'),
                                        Tab(text: 'Cancelled'),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: TabBarView(
                                      children: [
                                        Center(child: Text('Tickets for Upcoming events',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)),
                                        Center(child: Text('Tickets for Completed events',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)),
                                        Center(child: Text('Tickets for Cancelled events',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }
                  return NotLogged();
                }
              }
          ),
        ),
      ),
    );
  }
}
