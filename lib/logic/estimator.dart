import 'package:room_renovation_estimator/models/room_data.dart';

class Estimator {
  final RoomData data;

  Estimator(this.data);

  double wallArea() {
    double lw = 2 * (data.length + data.width) * data.height;
    double dw = data.doors * 1.9 + data.windows * 1.5;
    double wArea = lw - dw;
    return wArea;
  }

  int liters() {
    int liter = (wallArea() * data.coats / data.coverage).ceil();
    return liter;
  }

  double paintCost() {
    double pCost = liters() * data.pricePerLiter;
    return pCost;
  }

  double floorArea() {
    double lw = data.length * data.width;
    return lw;
  }

  int tiles() {
    double tileArea = (data.tileSizeCm / 100) * (data.tileSizeCm / 100);
    int t = (floorArea() / tileArea * (1 + data.wastePercent / 100))
        .ceil(); //round up
    return t;
  }

  double tileCost() {
    double tCost = tiles() * data.pricePerTile;
    return tCost;
  }

  double rollArea() {
    double rArea = data.rollWidth * data.rollLength;
    return rArea;
  }

  int rolls() {
    int roll = (wallArea() / rollArea()).ceil() + 1;
    return roll;
  }

  double wallpaperCost() {
    double wCost = rolls() * data.pricePerRoll;
    return wCost;
  }

  double total() {
    double t = paintCost() + tileCost() + wallpaperCost();
    return t;
  }
}
