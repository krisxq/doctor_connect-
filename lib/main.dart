import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B6FE8),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FF),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    AppointmentsPage(),
    MessagesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                ),
                _NavItem(
                  icon: Icons.calendar_month_rounded,
                  label: 'Schedule',
                  selected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                ),
                _NavItem(
                  icon: Icons.chat_bubble_outline_rounded,
                  label: 'Messages',
                  selected: _selectedIndex == 2,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
                _NavItem(
                  icon: Icons.person_outline_rounded,
                  label: 'Profile',
                  selected: _selectedIndex == 3,
                  onTap: () => setState(() => _selectedIndex = 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? Theme.of(context).colorScheme.primary
        : Colors.grey.shade400;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight:
                selected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────
// Stub pages — real Home is in home_page.dart
// ──────────────────────────────────────────

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Schedule',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text('Your upcoming appointments',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
              const SizedBox(height: 24),
              _buildAppointmentTile(
                context,
                name: 'Dr. Krish Chaudhary',
                specialty: 'Neurology',
                date: 'Today',
                time: '14:30 – 15:30',
                assetImage: 'assets/doctor.png',
                color: const Color(0xFF3B6FE8),
              ),
              const SizedBox(height: 14),
              _buildAppointmentTile(
                context,
                name: 'Dr. Aisha Malik',
                specialty: 'General Physician',
                date: 'Thu, 12 Jun',
                time: '10:00 – 10:45',
                assetImage: 'assets/doctor3.png',
                color: const Color(0xFF27A99A),
              ),
              const SizedBox(height: 14),
              _buildAppointmentTile(
                context,
                name: 'Dr. Priya Sharma',
                specialty: 'Dermatology',
                date: 'Mon, 16 Jun',
                time: '09:00 – 09:30',
                assetImage: 'assets/doctor2.png',
                color: const Color(0xFFE87B3B),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentTile(
      BuildContext context, {
        required String name,
        required String specialty,
        required String date,
        required String time,
        required String assetImage,
        required Color color,
      }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(6),
            child: Image.asset(assetImage, fit: BoxFit.contain),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15)),
                const SizedBox(height: 2),
                Text(specialty,
                    style: TextStyle(
                        color: Colors.grey.shade500, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(date,
                    style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 4),
              Text(time,
                  style: TextStyle(
                      color: Colors.grey.shade500, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  static const _messages = [
    _Msg(
        'Dr. Krish Chaudhary',
        'Your test results look normal. No action needed.',
        '2m ago',
        'assets/doctor.png'),
    _Msg(
        'Dr. Priya Sharma',
        'Please apply the cream twice daily for 2 weeks.',
        '1h ago',
        'assets/doctor2.png'),
    _Msg(
        'Dr. Aisha Malik',
        'Come in for a follow-up next Monday.',
        'Yesterday',
        'assets/doctor3.png'),
    _Msg(
        'City Hospital',
        'Your appointment has been confirmed for June 12.',
        '2d ago',
        'assets/hospital.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Messages',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text('${_messages.length} conversations',
                  style:
                  TextStyle(color: Colors.grey.shade500, fontSize: 14)),
              const SizedBox(height: 24),
              ..._messages.map((m) => _MessageTile(msg: m)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Msg {
  final String name, text, time, asset;
  const _Msg(this.name, this.text, this.time, this.asset);
}

class _MessageTile extends StatelessWidget {
  final _Msg msg;
  const _MessageTile({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF3B6FE8).withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(6),
            child: Image.asset(msg.asset, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(msg.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 3),
                Text(msg.text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade500, fontSize: 12)),
              ],
            ),
          ),
          Text(msg.time,
              style:
              TextStyle(color: Colors.grey.shade400, fontSize: 11)),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Profile',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 24),
              // Avatar + name card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B6FE8), Color(0xFF5A8CF8)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: const Text('K',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Krish Chaudhary',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 18)),
                        SizedBox(height: 4),
                        Text('Patient ID: #MED-00412',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 13)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Health stats
              Row(
                children: [
                  _StatCard(label: 'Blood Type', value: 'B+'),
                  const SizedBox(width: 12),
                  _StatCard(label: 'Weight', value: '68 kg'),
                  const SizedBox(width: 12),
                  _StatCard(label: 'Height', value: '175 cm'),
                ],
              ),
              const SizedBox(height: 20),
              // Settings list
              _SettingsTile(
                  icon: Icons.favorite_border_rounded,
                  label: 'Health Records',
                  color: const Color(0xFFE87B3B)),
              _SettingsTile(
                  icon: Icons.shield_outlined,
                  label: 'Insurance',
                  color: const Color(0xFF3B6FE8)),
              _SettingsTile(
                  icon: Icons.notifications_none_rounded,
                  label: 'Notifications',
                  color: const Color(0xFF27A99A)),
              _SettingsTile(
                  icon: Icons.lock_outline_rounded,
                  label: 'Privacy & Security',
                  color: const Color(0xFFAB6FE8)),
              _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  label: 'Help & Support',
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label, value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ],
        ),
        child: Column(
          children: [
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Color(0xFF3B6FE8))),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _SettingsTile(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3))
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 15)),
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              size: 14, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}