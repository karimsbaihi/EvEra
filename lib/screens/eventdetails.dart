import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1a1a), // mainBlack
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with buttons
          Stack(
            children: [
              Image.asset(
                'assets/music.png', // Replace with your image path
                width: double.infinity,
                height: 450,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 16,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(Icons.share, color: Colors.white),
                    onPressed: () => _showShareSheet(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Event Title and Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'California Art Festival 2023 Dana Point 29-30',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/karim.png'),
                    ),
                    const SizedBox(width: 2), // Reduce spacing
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/karim.png'),
                    ),
                    const SizedBox(width: 2), // Reduce spacing
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/karim.png'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '+20,000 participant',
                      style: TextStyle(
                        color: Color(0xffB3B3B3), // inputHint
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _showShareSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff292929),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SizedBox(
          height: 250, // Increased height
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Share this event',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Icon(Icons.close, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16), // Added border radius
                      child: Image.asset(
                        'assets/music.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'California Art Festival 2023 Dana Point 29-30',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'July 31 · 07:30 PM',
                            style: TextStyle(
                              color: Color(0xffB3B3B3), // inputHint
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildShareOption(Icons.bluetooth, 'Bluetooth'),
                    _buildShareOption(Icons.mobile_friendly_rounded, 'Whatsapp'),
                    _buildShareOption(Icons.facebook, 'Facebook'),
                    _buildShareOption(Icons.one_x_mobiledata, 'Twitter'),
                    _buildShareOption(Icons.telegram, 'Telegram'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildShareOption(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xff565656), // thirdBlack
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
