import 'package:flutter/material.dart';
import '../../../../components/goBack.dart';
import '../../../../styles/colors.dart';
import 'changePass.dart';
import 'loginActivity.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool _isTwoFactorEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: const Text(
          'Security',
          style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
        centerTitle: true,
        backgroundColor: mainBlack,
        leading: (Navigator.canPop(context)?goBack():null),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage your security settings:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 20),
            _buildSecurityOption(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                );
              },
            ),
            Divider(color: thirdBlack, thickness: 1),
            _buildSecurityOption(
              icon: Icons.security,
              title: 'Enable Two-Factor Authentication',
              trailing: Switch(
                value: _isTwoFactorEnabled,
                onChanged: (value) {
                  setState(() {
                    _isTwoFactorEnabled = value;
                  });
                },
                activeColor: mainGreen,
                inactiveThumbColor: thirdBlack,
                inactiveTrackColor: secondBlack,
              ),
            ),
            Divider(color: thirdBlack, thickness: 1),
            _buildSecurityOption(
              icon: Icons.history,
              title: 'View Login Activity',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginActivityPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: mainGreen),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
      onTap: onTap,
    );
  }
}
