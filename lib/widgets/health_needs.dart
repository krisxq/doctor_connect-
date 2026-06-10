import 'package:flutter/material.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({super.key});

  static const _needs = [
    _Need('Appointment', 'assets/appointment.png', Color(0xFF3B6FE8)),
    _Need('Hospital', 'assets/hospital.png', Color(0xFFE87B3B)),
    _Need('Doctor', 'assets/doctor.png', Color(0xFF27A99A)),
    _Need('Immunity', 'assets/virus.png', Color(0xFFAB6FE8)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _needs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, i) => _NeedItem(need: _needs[i]),
    );
  }
}

class _Need {
  final String label, asset;
  final Color color;
  const _Need(this.label, this.asset, this.color);
}

class _NeedItem extends StatelessWidget {
  final _Need need;
  const _NeedItem({required this.need});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: need.color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Image.asset(need.asset, fit: BoxFit.contain),
        ),
        const SizedBox(height: 7),
        Text(
          need.label,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}