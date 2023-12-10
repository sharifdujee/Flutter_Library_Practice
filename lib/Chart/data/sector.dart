import 'dart:math';

import 'package:flutter/material.dart';

class Sector {
  final Color color;
  final double value;
  final String title;

  Sector({required this.color, required this.value, required this.title});
}

List<double> get randomNumber{
  final Random random = Random();
  final randomNumber = <double> [];
  for(int i =0; i<=7; i++){
    randomNumber.add(random.nextDouble() *100);

  }
  return randomNumber;


}

List<Sector>  get industrySector{
  return [
    Sector(color: Colors.lightBlueAccent,
        value: randomNumber[0],
        title: 'Information Technology'),
    Sector(color: Colors.white,
        value: randomNumber[1],
        title: 'Medicine'),
    Sector(color: Colors.green,
        value: randomNumber[2],
        title: 'Safety')
  ];
  
}
