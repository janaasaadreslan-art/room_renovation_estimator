import 'package:flutter/material.dart';
import 'package:room_renovation_estimator/models/room_data.dart';

import 'my_text_field.dart';

class FloorTab extends StatefulWidget {
  final RoomData data;

  const FloorTab({required this.data, super.key});

  @override
  State<FloorTab> createState() => _FloorTabState();
}

class _FloorTabState extends State<FloorTab> {
  final TextEditingController _tilePriceCtrl =
      TextEditingController(); //controllers
  final TextEditingController _rollPriceCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tilePriceCtrl.text = widget.data.pricePerTile.toString();
    _rollPriceCtrl.text = widget.data.pricePerRoll.toString();
  }

  @override
  void dispose() {
    _tilePriceCtrl.dispose();
    _rollPriceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        MyTextField(hint: 'Price per tile (\$)', controller: _tilePriceCtrl),
        const SizedBox(height: 20),
        MyTextField(hint: 'Price per roll (\$)', controller: _rollPriceCtrl),
        const SizedBox(height: 20),

        DropdownMenu<double>(
          label: const Text('Tile size'),
          initialSelection: widget.data.tileSizeCm,
          expandedInsets: EdgeInsets.zero,
          //full width
          onSelected: (val) {
            if (val != null) {
              setState(() {
                widget.data.tileSizeCm = val;
              });
            }
          },
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 30.0, label: '30 x 30 cm'),
            DropdownMenuEntry(value: 45.0, label: '45 x 45 cm'),
            DropdownMenuEntry(value: 60.0, label: '60 x 60 cm'),
          ],
        ),
      ],
    );
  }
}
