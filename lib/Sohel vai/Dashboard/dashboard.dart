import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.elliptical(5, 10),
                  bottomLeft: Radius.circular(10),
                )),
            child: ClipOval(
              child: Container(
                color: Colors.white,
               /* child: const Image(
                  image: AssetImage('images/img_1.png'),
                  fit: BoxFit.cover,
                ),*/

              ),
              

            ),

          ),


        ],

      ),

    );
  }
}
