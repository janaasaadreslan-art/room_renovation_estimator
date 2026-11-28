import 'package:flutter/material.dart';
import 'package:room_renovation_estimator/models/room_data.dart';

import 'my_text_field.dart';
import 'my_button.dart';

class RoomTab extends StatefulWidget {
  final RoomData data;

  const RoomTab({required this.data, super.key});

  @override
  State<RoomTab> createState() => _RoomTabState();
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
        const SizedBox(height: 20),
        MyTextField(hint: 'Width (m)', controller: _widthCtrl),
        const SizedBox(height: 20),
        MyTextField(hint: 'Height (m)', controller: _heightCtrl),
        const SizedBox(height: 20),

        //doors
        Container(
          //keeps the text away from the edge
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              const Text(
                'Doors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB85042),
                ),
              ),
              const Spacer(),

              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (widget.data.doors > 0) {
                      widget.data.doors--;
                    }
                  });
                },
              ),
              Text(
                '${widget.data.doors}',
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget.data.doors++;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        //windows
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              const Text(
                'Windows',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB85042),
                ),
              ),
              const Spacer(),

              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (widget.data.windows > 0) {
                      widget.data.windows--;
                    }
                  });
                },
              ),
              Text(
                '${widget.data.windows}',
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget.data.windows++;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        MyButton(
          text: 'Next',
          onPressed: () {
            try {
              widget.data.length = double.parse(_lengthCtrl.text);
              widget.data.width = double.parse(_widthCtrl.text);
              widget.data.height = double.parse(_heightCtrl.text);
              DefaultTabController.of(context).animateTo(1);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill all fields with numbers'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
