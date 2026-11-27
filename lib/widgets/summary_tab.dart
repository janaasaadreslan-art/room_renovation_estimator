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
      ],
    );
  }
}
