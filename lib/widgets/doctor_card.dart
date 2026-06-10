import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String rating;
  final String assetImage;
  final Color color;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.assetImage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(assetImage, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Text(specialty,
              style: TextStyle(
                  color: Colors.grey.shade500, fontSize: 10),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star_rounded,
                  size: 14, color: Colors.amber.shade600),
              const SizedBox(width: 3),
              Text(rating,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 11)),
            ],
          )
        ],
      ),
    );
  }
}