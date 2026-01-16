import 'package:flutter/material.dart';

// Color
const Color kPrimaryColor = Color(0xFF0066FF);
const Color kAccentColor = Color(0xFF00C2FF);
const Color kBackgroundColor = Color(0xFFFFFFFF);
const double kDefaultPadding = 24.0;

class User {
  final String name;
  final String role;
  final String profileImagePath;

  const User({
    required this.name,
    required this.role,
    required this.profileImagePath,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _currentUser = User(
    name: 'Rifai Gusnian',
    role: 'Premium User',
    profileImagePath: 'assets/images/wkwk.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: false,

        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [kPrimaryColor, kAccentColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds),
            child: const Text(
              'QRID',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 26,
                fontFamily: 'SF Pro',
                letterSpacing: -1.2,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const UserProfileHeader(user: _currentUser),
            const SizedBox(height: 30),

            // --- HERO BANNER QRID ---
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                  colors: [kPrimaryColor, kAccentColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -50,
                    top: -50,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Text(
                            'NEW FEATURE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Generate Faster\nwith QRID Web',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'SF Pro',
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: Icon(
                      Icons.auto_awesome,
                      size: 140,
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: 'SF Pro',
              ),
            ),
            const SizedBox(height: 16),

            // --- MENU BUTTONS GRADIENT ---
            Row(
              children: const [
                Expanded(
                  child: _MenuButton(
                    icon: Icons.add_box_rounded,
                    label: 'Create',
                    route: '/create',
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _MenuButton(
                    icon: Icons.qr_code_scanner_rounded,
                    label: 'Scan',
                    route: '/scan',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),
            const Text(
              'Highlights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: 'SF Pro',
              ),
            ),
            const SizedBox(height: 16),

            _buildFeatureItem(
              Icons.security_rounded,
              'Secure Encryption',
              'Your QR data is encrypted and safe.',
            ),
            _buildFeatureItem(
              Icons.cloud_done_rounded,
              'Cloud Sync',
              'Access your history everywhere.',
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [kPrimaryColor, kAccentColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: kPrimaryColor.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage(user.profileImagePath),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${user.name.split(' ')[0]}!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'SF Pro',
              ),
            ),
            Text(
              user.role,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
                fontFamily: 'SF Pro',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.icon,
    required this.label,
    required this.route,
  });
  final IconData icon;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kPrimaryColor, kAccentColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.25),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 42),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
