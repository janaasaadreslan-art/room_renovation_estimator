import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String title;

  final String detail;

  final String cost;

  const ResultCard({
    required this.title,
    required this.detail,
    required this.cost,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB85042),
            ),
          ),
          const Spacer(),
          Text(
            detail,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            cost,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB85042),
            ),
          ),
        ],
      ),
    );
  }
}
