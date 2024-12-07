
import 'package:evera/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/bottombar.dart';
import '../components/notLogged.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Widget createOption(IconData icon,String title, [String route = '']){
    return GestureDetector(
      onTap: () async {
        if(route!=''){
          if(route=='/home'){
            var prefs = await SharedPreferences.getInstance();
            prefs.setBool('logged',false);
          }
            Navigator.pushNamed(context, route);
        }
      },
      child: ListTile(
        leading: Icon(icon,color: Colors.white,),
        title: Text(title,style: const TextStyle(color: Colors.white),),
        trailing: const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      bottomNavigationBar: const BottomBar(currentIndex: 4),
        body: SafeArea(
          child: Padding(
            padding:  const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
          child:FutureBuilder(
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
                            Container(
                                padding: EdgeInsets.zero,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 2),
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                height:MediaQuery.sizeOf(context).width * 0.3,
                                width:MediaQuery.sizeOf(context).width * 0.3,
                                child: FittedBox(fit:BoxFit.cover,child: Image.asset('assets/karim.png'))
                            ),
                            const Text("Karim Sbaihi",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                            Text("karimsbaihi@gmail.com",style: TextStyle(color: thirdBlack,fontSize: 14,fontWeight: FontWeight.w500),),
                            // GestureDetector(
                            //   onTap: (){
                            //     // Navigator.pushNamed(context, '/login');
                            //   },
                            //   child: Container(
                            //     margin: const EdgeInsets.all(20),
                            //     width: MediaQuery.sizeOf(context).width * 0.4,
                            //     height: MediaQuery.sizeOf(context).height * 0.05,
                            //     decoration: BoxDecoration(
                            //       color: mainGreen,
                            //       borderRadius: BorderRadius.circular(50),
                            //     ),
                            //     child: const Center(
                            //       child: Text(
                            //         "Edit Profile",
                            //         style: TextStyle(fontSize: 20,color: Colors.white),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 30,),
                            createOption(Icons.calendar_today_outlined,"Calendar",'/calendar'),
                            createOption(Icons.notifications_active_outlined,"Notifications",'/notifications'),
                            Divider(color: thirdBlack,),
                            createOption(Icons.calendar_today_outlined,"Personal Information",'/personalInfo'),
                            createOption(Icons.security,"Security",'/security'),
                            createOption(Icons.link,"Linked Accounts",'/linkedAcc'),
                            createOption(Icons.payment,"Payment",'/payment'),
                            createOption(Icons.logout,"Logout",'/home'),
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
