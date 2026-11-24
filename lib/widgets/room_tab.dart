import 'package:flutter/material.dart';
import 'package:room_renovation_estimator/models/room_data.dart';

import 'my_text_field.dart';

class RoomTab extends StatefulWidget {
  final RoomData data;

  const RoomTab({required this.data, super.key});

  @override
  _RoomTabState createState() {
    return _RoomTabState();
  }
}

class _RoomTabState extends State<RoomTab> {
  //retrieve the value of the TextFields
  final TextEditingController _lengthCtrl = TextEditingController();
  final TextEditingController _widthCtrl = TextEditingController();
  final TextEditingController _heightCtrl = TextEditingController();
// runs once when the tab opens: fill the boxes from RoomData
  @override
  void initState() {
    super.initState();
    _lengthCtrl.text = widget.data.length.toString();
    _widthCtrl.text = widget.data.width.toString();
    _heightCtrl.text = widget.data.height.toString();
  }

  //dispose method triggered whenever the created object from the stateful widget
  //is removed permanently from the widget tree
  @override
  void dispose() {
    _lengthCtrl.dispose();
    _widthCtrl.dispose();
    _heightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        MyTextField(hint: 'Length (m)', controller: _lengthCtrl),
        const SizedBox(height: 12),
        MyTextField(hint: 'Width (m)', controller: _widthCtrl),
        const SizedBox(height: 12),
        MyTextField(hint: 'Height (m)', controller: _heightCtrl),
        const SizedBox(height: 12),
      ],
    );
  }
}
