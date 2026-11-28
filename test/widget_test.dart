import 'package:flutter_test/flutter_test.dart';
import 'package:room_renovation_estimator/models/room_data.dart';
import 'package:room_renovation_estimator/logic/estimator.dart';

void main() {
  test('Default room costs \$460', () {
    final est = Estimator(RoomData());
    expect(est.total(), 460);
  });

  test('Default Wallpaper area is 49.1 m²', () {
    final est = Estimator(RoomData());
    expect(est.wallArea(), closeTo(49.1, 0.01));
  });

  test('Default Liters', () {
    final est = Estimator(RoomData());
    expect(est.liters(), 10);
  });

  test('Default Tiles', () {
    final est = Estimator(RoomData());
    expect(est.tiles(), 62);
  });

  test('Default Rolls', () {
    final est = Estimator(RoomData());
    expect(est.rolls(), 11);
  });
}
