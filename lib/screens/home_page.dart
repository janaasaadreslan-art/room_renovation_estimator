import 'package:flutter/material.dart';
import 'package:room_renovation_estimator/models/room_data.dart';
import 'package:room_renovation_estimator/widgets/room_tab.dart';
import 'package:room_renovation_estimator/widgets/paint_tab.dart';
import 'package:room_renovation_estimator/logic/estimator.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RoomData data = RoomData();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Renovate'),
          foregroundColor: Colors.white,//renovate word color
          backgroundColor: const Color(0xFFB85042),

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(72),
            child: ColoredBox(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: TabBar(
                labelColor: Color(0xFFB85042),//rust red
                unselectedLabelColor: Colors.grey,
                indicatorColor: const Color(0xFFB85042),//rust red
                tabs: [
                  const Tab(text: 'Room' ,icon: Icon(Icons.straighten)),
                  const Tab(text: 'Paint',icon: Icon(Icons.format_paint)),
                  const Tab(text: 'Floor', icon: Icon(Icons.grid_on)),
                  const Tab(text: 'Summary', icon: Icon(Icons.receipt_long)),
                ],
              ),
            ),
          ),
        ),

        body: TabBarView(
          children: [
            RoomTab(data: data),
            PaintTab(data: data),
            const Center(child: Text('Floor page')),
            const Center(child: Text('Summary page')),
          ],
        ),
      ),
    );
  }
}
