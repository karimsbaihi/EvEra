import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(50, 300); // Initial values

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1a1a), // Dark background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Price Label
            const Text(
              "Price Range",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 24),

            // Range Slider
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                RangeSlider(
                  values: _currentRangeValues,
                  min: 0,
                  max: 500,
                  divisions: 100,
                  activeColor: Colors.cyan, // Active track color
                  inactiveColor: Colors.grey, // Inactive track color
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),

                // Tooltip for prices above thumbs
                Positioned(
                  left: (_currentRangeValues.start / 500) *
                      MediaQuery.of(context).size.width,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      children: [
                        Text(
                          "\$${_currentRangeValues.start.round()}",
                          style: const TextStyle(color: Colors.cyan),
                        ),
                        const Icon(Icons.adjust_sharp),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

