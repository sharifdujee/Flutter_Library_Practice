

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modal Bottom Sheet Example"),
      ),
      body: Builder(
        builder: (context) {
          return Center(

            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      elevation: 0,
                      enableDrag: true,
                      backgroundColor: Colors.yellow,
                      useRootNavigator: true,
                      isDismissible: true,
                      isScrollControlled: true,
                      barrierColor: Colors.red,
                      barrierLabel: 'Server Down',


                      context: context,
                      builder: (context) {
                        return const Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.share),
                              title: Text('Share'),
                            ),
                            ListTile(
                              leading: Icon(Icons.copy),
                              title: Text('Copy Link'),
                            ),
                            ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text("Modal Sheet"),
                  
                ),
                ElevatedButton(onPressed: (){
                  showCupertinoModalPopup(
                    barrierColor: Colors.green,
                      context: context,
                      builder: (context){
                    return CupertinoPageScaffold(
                      navigationBar: const CupertinoNavigationBar(
                        middle: Text('data'),
                      ),
                        child: Center(
                      child: Column(
                        children: [
                          CupertinoFormSection(
                              children: const [
                                CupertinoFormRow(

                                    prefix: Icon(Icons.currency_bitcoin),

                                    child: Text('Your Form Here',
                                    style: TextStyle(

                                    ),),

                                )
                              ])
                        ],
                      ),
                    ));
                  });
                }, child: const Text("Modal Cupertino sheet"),
                ),
                ElevatedButton(onPressed: (){
                  showCupertinoModalPopup(context: context,
                      builder: (context){
                    return const CupertinoActionSheet(
                      title: Text("Hello"),
                      message: Text('Welcome To Cupertino Action Bar Modal '),

                    );

                      });

                },
                    child: Text('Bar Modal'))
                
              ],
            ),

          );
        },
      ),
    );
  }
  Widget _dottedBorder(){
    return DottedBorder(child: Container(

    )
    );
    
  }
}
