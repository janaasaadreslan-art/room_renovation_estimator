import 'package:flutter/material.dart';
import 'package:room_renovation_estimator/models/room_data.dart';
import 'package:room_renovation_estimator/logic/estimator.dart';

import 'result_card.dart';

class SummaryTab extends StatelessWidget {
  //it only shows result
  final RoomData data;

  const SummaryTab({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final est = Estimator(data);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ResultCard(
          title: 'Paint',
          detail: '${est.liters()} L',
          cost: '\$${est.paintCost().toStringAsFixed(2)}',
        ),
        const SizedBox(height: 12),
        ResultCard(
          title: 'Tiles',
          detail: '${est.tiles()} tiles',
          cost: '\$${est.tileCost().toStringAsFixed(2)}',
        ),
        const SizedBox(height: 12),
        ResultCard(
          title: 'Wallpaper',
          detail: '${est.rolls()} rolls',
          cost: '\$${est.wallpaperCost().toStringAsFixed(2)}',
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFB85042),

            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              const Text(
                'Grand Total',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '\$${est.total().toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
