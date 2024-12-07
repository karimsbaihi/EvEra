import 'package:flutter/material.dart';

import '../styles/colors.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> categories = [
    "All",
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

  final Set<String> selectedCategories = {};
  RangeValues _priceRange = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {}, // Prevent tapping through to dismiss
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.4,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff1a1a1a),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      // Drag handle
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Filter Events",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: secondBlack,
                            hintText: 'Enter your location',
                            hintStyle: const TextStyle(
                              color: Color(0xffB3B3B3),
                            ),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: mainGreen,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 8, top: 16),
                        child: const Text(
                          "Categories",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.map((category) {
                            final isSelected = selectedCategories.contains(category);
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ChoiceChip(
                                label: Text(category),
                                selected: isSelected,
                                onSelected: (isSelected) {
                                  setState(() {
                                    if (isSelected) {
                                      selectedCategories.add(category);
                                    } else {
                                      selectedCategories.remove(category);
                                    }
                                  });
                                },
                                labelStyle: TextStyle(
                                  color: isSelected ? Colors.black : const Color(0xffB3B3B3),
                                ),
                                selectedColor: mainGreen,
                                backgroundColor: secondBlack,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
                        child: const Text(
                          "Price",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 4,
                                activeTrackColor: mainGreen,
                                inactiveTrackColor: Colors.grey,
                                thumbColor: mainGreen,
                                overlayColor: mainGreen.withOpacity(0.2),
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                              ),
                              child: RangeSlider(
                                values: _priceRange,
                                min: 0,
                                max: 100,
                                divisions: 10,
                                labels: RangeLabels(
                                  '\$${_priceRange.start.round()}',
                                  '\$${_priceRange.end.round()}',
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _priceRange = values;
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${_priceRange.start.round()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '\$${_priceRange.end.round()}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Apply button click
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainGreen,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}