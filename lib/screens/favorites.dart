import 'package:evera/components/bottombar.dart';
import 'package:evera/screens/details.dart';
import 'package:evera/styles/colors.dart';
import 'package:evera/components/eventCard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/notLogged.dart';
import '../components/notificationIcon.dart';
import '../database/db_event.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(currentIndex: 3),
      backgroundColor: mainBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
          child: FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return CircularProgressIndicator();
                }else{
                  bool? logged=snapshot.data?.getBool('logged');
                  if(logged!=null){
                    if(logged){
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text("Your"),
                              titleTextStyle: TextStyle(fontSize: 15,color: inputHint),
                              subtitle: const Text("Favorites"),
                              subtitleTextStyle: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),
                              trailing: NotificationIcon(),
                            ),
                            FutureBuilder(
                                future: DbEvent.fetchEvents(),
                                builder: (context,snapshot){
                                  if(snapshot.connectionState == ConnectionState.waiting){
                                    return Center(child: CircularProgressIndicator(color: mainGreen,));
                                  }else{
                                    return ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context,index){
                                        return EventCard(evnt : snapshot.data![index],favorite: true,
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(eventData: context,)));
                                        },
                                        );
                                      },
                                    );
                                  }
                                }
                            ),
                          ],
                        ),
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
