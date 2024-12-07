
import 'package:evera/styles/colors.dart';
import 'package:flutter/material.dart';



class Description1 extends StatefulWidget {
  const Description1({super.key});

  @override
  State<Description1> createState() => _Description1State();
}

class _Description1State extends State<Description1> {

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
                stops: [0,0.78],
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
                  "Grab all events now only in your hands",
                  style: TextStyle(fontSize: 33,color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18,10,20,30),
                  child: const Text(
                    "Stream is here  to help you to find the best events based on your interests.",
                    style: TextStyle(fontSize: 15,color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/description2');
                  },
                  child: Container(
                    width: 270,
                    height: 60,
                    decoration: BoxDecoration(
                      color: mainGreen,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 25,color: Colors.white),
                      ),
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
