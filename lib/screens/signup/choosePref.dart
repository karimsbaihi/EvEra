import 'package:evera/components/goBack.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../../styles/colors.dart';

class Prefs extends StatefulWidget {
  const Prefs({super.key});

  @override
  State<Prefs> createState() => _PrefsState();
}

class _PrefsState extends State<Prefs> {
  Set<int> selectedCategories = {}; 

  final List<String> categories = [
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
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        backgroundColor: mainBlack,
        elevation: 0,
        leading: goBack(),
        title: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/home');
            },
            child: Text("Skip",style: TextStyle(color: mainGreen,),textAlign: TextAlign.right,),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Categories",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Select a few categories based on your interests to get started",
              style: TextStyle(
                color: Color(0xffB3B3B3),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(categories.length, (index) {
                  bool isSelected = selectedCategories.contains(index);
                  String category = categories[index];
                  String imagePath = 'assets/${category.toLowerCase()}.png';

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedCategories.remove(index);
                        } else {
                          selectedCategories.add(index);
                        }
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? secondBlack : secondBlack,
                            image: DecorationImage(
                              image: AssetImage(imagePath), 
                              fit: BoxFit.cover, 
                              colorFilter: isSelected
                                  ? ColorFilter.mode(
                                      Colors.black.withOpacity(0.5),
                                      BlendMode.darken,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        Text(
                          category,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(isSelected ? 0.8 : 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (isSelected)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Container(
                                color: mainBlack.withOpacity(0.3),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  print("Selected categories: ${selectedCategories.map((
                      index) => categories[index]).toList()}");
                  Navigator.pushNamed(context, '/home');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
