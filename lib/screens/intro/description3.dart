
import 'package:evera/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:evera/components/goBack.dart';


class Description3 extends StatefulWidget {
  const Description3({super.key});

  @override
  State<Description3> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description3> {

  // final String url='https://adgdokcdimmrvrildtiw.supabase.co/storage/v1/object/sign/files/background.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJmaWxlcy9iYWNrZ3JvdW5kLnBuZyIsImlhdCI6MTczMzMyNzI5NCwiZXhwIjoxNzY0ODYzMjk0fQ.1lTEBbE9GcZTTDltzyjxfBdrN-1naDodDEAhF_PDeX8&t=2024-12-04T15%3A47%3A44.453Z';
  //
  // Future<Uint8List> _getBackground(String url) async {
  //   // await Future.delayed(Duration(seconds: 100));
  //   final response = await http.get(Uri.parse(url));
  //   return response.bodyBytes;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          // FutureBuilder(
          //   future: _getBackground(url),
          //   builder: (context,snapshot){
          //     if(snapshot.connectionState == ConnectionState.waiting){
          //       return Container(
          //         width: double.infinity,
          //         height: double.infinity,
          //         color: mainBlack,
          //       );
          //     }else{
          //       return snapshot.hasData
          //           ? Image.memory(
          //         snapshot.data!,
          //         fit: BoxFit.cover, // Ensure the image covers the entire area
          //         width: double.infinity,
          //         height: double.infinity,
          //       )
          //           : SizedBox.shrink();
          //     }
          //   },
          // ),
          Image.asset(
            'assets/image.png',
            fit: BoxFit.cover, // Ensure the image covers the entire area
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  mainGreen.withOpacity(0), // Start color
                  Colors.black.withOpacity(1), // End color
                ],
                stops: const [0,0.78],
                begin: Alignment.topCenter, // Start point of the gradient
                end: Alignment.bottomCenter, // End point of the gradient
              ),
            ),
            child: null,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Spacer(),
                const Text(
                  "Let’s go to your favorite event now",
                  style: TextStyle(fontSize: 35,color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18,10,20,30),
                  child: const Text(
                    "Stream is here  to help you to find the best events based on your interests.",
                    style: TextStyle(fontSize: 15,color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 9,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Container(
                            // width: MediaQuery.sizeOf(context).,
                            height: MediaQuery.sizeOf(context).height * 0.07,
                            decoration: BoxDecoration(
                              color: mainGreen,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 25,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 9,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/signup1');
                          },
                          child: Container(
                            // width: 180,
                            height: MediaQuery.sizeOf(context).height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontSize: 25,color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          SafeArea(child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: goBack(color : Colors.black),
          )),
        ],
      ),

    );
  }
}
