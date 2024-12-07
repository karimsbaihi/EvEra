import 'package:evera/screens/eventdetails.dart';
import 'package:evera/screens/filter.dart';
import 'package:evera/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../components/event.dart';
import '../components/goBack.dart';
import '../database/db_event.dart';

class ExploreMap extends StatefulWidget {
  const ExploreMap({super.key});

  @override
  State<ExploreMap> createState() => _ExploreMapState();
}

class _ExploreMapState extends State<ExploreMap> {

  TextEditingController searching=TextEditingController();

  // List of tagged locations
  final List<Map<String, dynamic>> locations = [
    {
      'name': 'Palais des Nations',
      'position': LatLng(36.7708, 3.0462),
      // 'description': 'Main Office',
      'icon': Icons.location_pin,
      'color': Colors.blue
    },
    {
      'name': 'Salle Harcha Hacène',
      'position': LatLng(36.7465,3.0619),
      // 'description': 'R&D Facility',
      'icon': Icons.location_pin,
      'color': Colors.green
    },
    {
      'name': 'Sofitel Algiers Hamma Garden',
      'position': LatLng(36.7767,3.0584),
      // 'description': 'Storage Facility',
      'icon': Icons.location_pin,
      'color': Colors.red
    },
    {
      'name': 'Moorish Cafe',
      'position': LatLng(36.7706,3.0539),
      // 'description': 'Employee Training Facility',
      'icon': Icons.location_pin,
      'color': Colors.purple
    }
  ];

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
    var search=(ModalRoute.of(context)?.settings.arguments as Map)['search'];
    searching.text=search;
    return Scaffold(
      body: Stack(
        children:[
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(36.7697, 3.0574),
              // initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: locations.map((location) {
                  return Marker(
                    point: location['position'],
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () {
                        // Show details when marker is tapped
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              // title: Text(location['name']),
                              content: Text(location['name']),
                            );
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            location['icon'],
                            color: location['color'],
                            size: 40,
                          ),
                          // Text(
                          //   location['name'],
                          //   style: TextStyle(
                          //     color: location['color'],
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20) ,
                  decoration:BoxDecoration(
                      color: secondBlack,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                        // color: Colors.white,
                      )
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: (Navigator.canPop(context)?goBack():null),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searching,
                          style: TextStyle(color: inputHint),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: inputHint),
                            hintText: "Search Events, Artists ... ",
                            border: const OutlineInputBorder(
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
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
                              return EventToExplore(event : snapshot.data![index],
                              onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailPage()));
                              },
                              );
                            },
                          );
                        }
                      }
                  ),
                ),

              ],
            ),
          ),
        ]
      ),
    );
  }
}