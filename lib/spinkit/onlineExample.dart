import 'dart:developer';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:practice/Firebase%20CRUD/userregistration.dart';
class OnlineExample extends StatefulWidget {
  const OnlineExample({super.key});

  @override
  State<OnlineExample> createState() => _OnlineExampleState();
}

class _OnlineExampleState extends State<OnlineExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpinKit '),
        backgroundColor: Colors.green,
      ),
      body: GridView.count(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 3,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const SpinKitChasingDots(
                    color: Colors.indigo,
                  ),

                  Divider(),
                  const SpinKitChasingDots(
                    color: Colors.green,
                  ),

                ],
              ),
              Divider(
                height: 20,
              ),
              Row(
                children: [
                  const SpinKitCubeGrid(
                    color: Colors.yellow,
                  ),
                  Divider(),
                ],
              )
            ],

          ),

          const SpinKitDancingSquare(
            color: Colors.amber,
          ),
          Divider(),
            const SpinKitDualRing(
                color: Colors.red
            ),
          Divider(),
          SpinKitDoubleBounce(
            color: Colors.deepPurple,
          ),
          Divider(),
          SpinKitFadingCircle(
            color: Colors.lightBlueAccent,
          ),
          Divider(),
          SpinKitFadingFour(
            color: Colors.pink,
          ),
          Divider(),
          SpinKitFadingCube(
            color: Colors.pink,
          ),
          Divider(),
          SpinKitHourGlass(color: Colors.red,
          ),
          Divider(),
          SpinKitPianoWave(
            color: Colors.deepOrange,
          ),
          Divider(),
          SpinKitPouringHourGlass(color: Colors.yellowAccent,
          ),
          Divider(),
          SpinKitPouringHourGlassRefined(color: Colors.lightGreen,
          ),
          Divider(),
          SpinKitWave(
            color: Colors.lightBlueAccent,
          ),
          Divider(),
          SpinKitPulse(
            color: Colors.purple,
          ),
          Divider(),
          SpinKitRing(color: Colors.blueGrey,
          ),
          Divider(),
          SpinKitPumpingHeart(
            color: Colors.red,
          ),
          Divider(),
          SpinKitRipple(
            color: Colors.black,
          ),
          Divider(),
          SpinKitSpinningCircle(
            color: Colors.red,
          ),
          Divider(),
          SpinKitRotatingPlain(
            color: Colors.lightGreen,
          ),
          Divider(),
          SpinKitWaveSpinner(color: Colors.yellowAccent)




        ],
      ),

    );
  }
}
