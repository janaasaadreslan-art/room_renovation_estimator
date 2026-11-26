import 'package:flutter/material.dart';
import 'package:room_renovation_estimator/models/room_data.dart';

import 'my_text_field.dart';
import 'my_button.dart';

class PaintTab extends StatefulWidget {
  final RoomData data;

  const PaintTab({required this.data, super.key});

  @override
  _PaintTabState createState() {
    return _PaintTabState();
  }
}

class _PaintTabState extends State<PaintTab> {
  final TextEditingController _coverageCtrl =
      TextEditingController(); //controllers
  final TextEditingController _priceCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _coverageCtrl.text = widget.data.coverage.toString();
    _priceCtrl.text = widget.data.pricePerLiter.toString();
  }

  @override
  void dispose() {
    _coverageCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        MyTextField(hint: 'Coverage (m²/L)', controller: _coverageCtrl),
        const SizedBox(height: 20),
        MyTextField(hint: 'Price per liter (\$)', controller: _priceCtrl),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              const Text(
                'Coats',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB85042),
                ),
              ),
              const Spacer(),
              Radio(
                value: 1,
                groupValue: widget.data.coats,
                onChanged: (val) {
                  //val is the value 1
                  setState(() {
                    //redraw the screen so dot move
                    widget.data.coats = val as int; //whole nb
                  });
                },
                activeColor: const Color(0xFFB85042),
              ),
              const Text(
                '1',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Radio(
                value: 2,
                groupValue: widget.data.coats,
                onChanged: (val) {
                  setState(() {
                    widget.data.coats = val as int;
                  });
                },
                activeColor: const Color(0xFFB85042),
              ),
              const Text(
                '2',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Radio(
                value: 3,
                groupValue: widget.data.coats,
                onChanged: (val) {
                  setState(() {
                    widget.data.coats = val as int;
                  });
                },
                activeColor: const Color(0xFFB85042),
              ),
              const Text(
                '3',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        MyButton(
          text: 'Next',
          onPressed: () {
            try {
              widget.data.coverage = double.parse(_coverageCtrl.text);
              widget.data.pricePerLiter = double.parse(_priceCtrl.text);
              DefaultTabController.of(context).animateTo(2);
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
