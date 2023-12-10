
import 'dart:math';
import 'package:collection/collection.dart';

class PricePoint {

  final double x;

  final double y;

  PricePoint({required this.x, required this.y });
}
  List<PricePoint> get  pricePoints{
    final Random random = Random();
    final randomNumber = <double> [];
    for(var i = 0 ; i<=11; i++){
      randomNumber.add(random.nextDouble());
    }
    return  randomNumber.mapIndexed(
        (index, element) => PricePoint(x: index.toDouble(), y: element)).toList();


  }


