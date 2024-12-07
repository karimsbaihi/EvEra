
import 'package:evera/screens/eventdetails.dart';
import 'package:evera/styles/colors.dart';
import 'package:evera/components/location.dart';
import 'package:flutter/material.dart';
import 'details.dart';
import '../components/bottombar.dart';
import '../components/event.dart';
import '../components/eventCard.dart';
import '../database/db_event.dart';
import 'filter.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<String> location=[];
  bool waiting =false;

  TextEditingController searching=TextEditingController();


  void showFilters() {
    showModalBottomSheet(
      isScrollControlled: true, // Important for full-height sheet
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return FilterScreen();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      bottomNavigationBar: const BottomBar(currentIndex: 1),
      body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  if(waiting)
                    const CircularProgressIndicator()
                  else
                    if(location.isEmpty || location.length==1)
                      GestureDetector(
                        onTap: () async {
                          waiting=true;
                          setState(() {});
                          location = await getCurrentLocation();
                          if(location.length==1){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(location[0]),
                                duration: const Duration(seconds: 3), // Duration for which the SnackBar is displayed
                              ),
                            );
                          }
                          waiting=false;
                          setState(() {});

                        },
                        child: Text("Get location",style: TextStyle(color: mainGreen,fontWeight: FontWeight.w600),),
                      )
                    else
                      if(location.length!=1)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your location:",style: TextStyle(fontSize: 11,color: thirdBlack,fontWeight: FontWeight.w600),),
                            Text("${location[1]}, ${location[0]}",style: const TextStyle(color: Colors.white,fontSize: 14),)
                          ],
                        ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.symmetric(vertical: 20) ,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      )
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searching,
                            onChanged: (value){
                              Navigator.pushNamed(context, '/exploreMap',arguments: {'search':value}).then((value){searching.text='';});
                            },
                            style: TextStyle(color: inputHint),
                          decoration: const InputDecoration(
                             hintText: "Search Events, Artists ... ",
                             border: OutlineInputBorder(
                               borderSide: BorderSide.none,
                             ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          width: 2,
                          height: 40,
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: (){
                            showFilters();
                          },
                            child: Icon(Icons.filter_alt_sharp ,color: mainGreen,)
                        ),
                      ],
                    ),
                  ),

                  Categories(),

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
                                return EventToExplore(event : snapshot.data![index],onTap:(){
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
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              return EventCard(evnt : snapshot.data![index],onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(eventData:context)));
                            },);
                            },
                          );
                        }
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}



class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  int selected=0;

  List<String> categories=[
    'All',
    "Music",
    "Theatre",
    "Dance",
    "Painting",
    "Photography",
    "Sculpture",
    "Cinema",
    "Literature",
    "Design",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=0;i<6;i++)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: (){
                  selected=i;
                  setState(() {

                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (selected==i?mainGreen:secondBlack)
                  ),
                  child: Center(
                    child: Text(categories[i],style: const TextStyle(fontSize: 15,color: Colors.white),),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
