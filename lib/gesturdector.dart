import 'package:flutter/material.dart';
class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({Key? key}): super(key: key);

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  bool _lightIsOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Detector"),
      ),
      body: Container(
        alignment: FractionalOffset.center,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Padding(padding: EdgeInsets.all(8.0),
              child: Icon(Icons.lightbulb_circle_outlined,
                color: _lightIsOn ? Colors.yellow.shade600 : Colors.black,
                size: 100,
              ),

            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  _lightIsOn = !_lightIsOn;
                });

              },

              child: Container(
                color: Colors.yellow.shade600,
                padding: EdgeInsets.all(8.0),
                child:  Text(_lightIsOn? 'Turn Light On': 'Turn Light off'),
              ),



            ),



            
            

          ],
        ),

      ),

    );
  }
}
