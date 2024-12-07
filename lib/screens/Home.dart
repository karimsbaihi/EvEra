
import 'package:evera/components/notificationIcon.dart';
import 'package:evera/screens/details.dart';
import 'package:evera/screens/eventdetails.dart';
import 'package:evera/styles/colors.dart';
import 'package:evera/components/event.dart';
import 'package:evera/components/eventCard.dart';
import 'package:evera/components/ticket.dart';
import 'package:evera/database/db_event.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/bottombar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  void changeScreen(int index){
    List<String> screens=['/home','/explore','/tickets','/login','/profile'];
    Navigator.pushNamed(context,screens[index]);
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(currentIndex: 0,),
      backgroundColor: mainBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }else{
                      bool? logged=snapshot.data?.getBool('logged');
                      if(logged!=null){
                        if(logged){
                          return Column(
                            children: [
                              ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: SizedBox(
                                      height:MediaQuery.sizeOf(context).width * 0.14,
                                      width:MediaQuery.sizeOf(context).width * 0.14,
                                      child: FittedBox(fit : BoxFit.cover,child: Image.asset('assets/karim.png'))),
                                  title: const Text("Hi, Karim"),
                                  titleTextStyle: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500),
                                  subtitle: const Text("Find your favorite events"),
                                  subtitleTextStyle: TextStyle(fontSize: 11,color: inputHint),
                                  trailing: const NotificationIcon()
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                                child: Text("Your ticket Event's",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                              ),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.22,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context,index){
                                    return const Ticket(image: 'assets/guitar.png',title: 'California Art Festival 2023 Dana Point 29-30',time: '10:00 PM',location: 'California, CA',);
                                  },
                                ),
                              ),
                            ],
                          );
                        }
                      }
                      return const SizedBox.shrink();
                    }
                  }
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  children: [
                    const Text("Explore Nearby",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                    const Spacer(),
                    Text("View All",style: TextStyle(color: mainGreen,fontSize: 14),),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: FutureBuilder(
                    future: DbEvent.fetchEvents(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(color: mainGreen,));
                      }else{
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                            return EventToExplore(event : snapshot.data![index],onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailPage()));
                            },);
                          },
                        );
                      }
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  children: [
                    const Text("More Events",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                    const Spacer(),
                    Text("View All",style: TextStyle(color: mainGreen,fontSize: 14),),
                  ],
                ),
              ),

              FutureBuilder(
                  future: DbEvent.fetchEvents(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(color: mainGreen,));
                    }else{
                      if(snapshot.hasData){
                        print(snapshot.data);
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){

                            return EventCard(evnt : snapshot.data![index],onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(eventData: context,)));

                            },);
                          },
                        );
                      }else{
                        print('no data');
                        return const SizedBox.shrink();
                      }
                    }
                  }
              ),
            ],
          ),
        ),
      ),
      );
  }
}
