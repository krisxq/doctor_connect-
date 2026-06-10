import 'package:flutter/material.dart';
import '../widgets/upcoming_card.dart';
import '../widgets/health_needs.dart';
import '../widgets/doctor_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(context),
            const SizedBox(height: 6),
            _buildSearchBar(context),
            const SizedBox(height: 22),
            _sectionLabel(context, 'Upcoming Appointment'),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: UpcomingCard(),
            ),
            const SizedBox(height: 26),
            _sectionLabel(context, 'Health Needs'),
            const SizedBox(height: 14),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: HealthNeeds(),
            ),
            const SizedBox(height: 26),
            _sectionLabel(context, 'Top Doctors',
                action: 'See all'),
            const SizedBox(height: 14),
            SizedBox(
              height: 200,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: const [
                  DoctorCard(
                    name: 'Dr. Krish Chaudhary',
                    specialty: 'Neurology',
                    rating: '4.9',
                    assetImage: 'assets/doctor.png',
                    color: Color(0xFF3B6FE8),
                  ),
                  SizedBox(width: 14),
                  DoctorCard(
                    name: 'Dr. Priya Sharma',
                    specialty: 'Dermatology',
                    rating: '4.7',
                    assetImage: 'assets/doctor2.png',
                    color: Color(0xFFE87B3B),
                  ),
                  SizedBox(width: 14),
                  DoctorCard(
                    name: 'Dr. Aisha Malik',
                    specialty: 'General Physician',
                    rating: '4.8',
                    assetImage: 'assets/doctor3.png',
                    color: Color(0xFF27A99A),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            _buildHealthTip(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
      color: const Color(0xFFF5F7FF),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Krish 👋',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  )),
              const SizedBox(height: 2),
              Text(
                'How are you feeling today?',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
            iconSize: 28,
            color: Colors.grey.shade700,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 18,
              backgroundColor:
              const Color(0xFF3B6FE8).withOpacity(0.12),
              child: const Text(
                'K',
                style: TextStyle(
                    color: Color(0xFF3B6FE8),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            Icon(Icons.search_rounded,
                color: Colors.grey.shade400, size: 22),
            const SizedBox(width: 10),
            Text('Search doctors, symptoms…',
                style: TextStyle(
                    color: Colors.grey.shade400, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(BuildContext context, String title,
      {String? action}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 16,
              )),
          const Spacer(),
          if (action != null)
            Text(action,
                style: const TextStyle(
                    color: Color(0xFF3B6FE8),
                    fontWeight: FontWeight.w600,
                    fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildHealthTip(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF27A99A), Color(0xFF3BC4B5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('💡  Health Tip',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 6),
                  Text(
                    'Drink at least 8 glasses of water daily to stay hydrated.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Image.asset('assets/virus.png', width: 60, height: 60),
          ],
        ),
      ),
    );
  }
}