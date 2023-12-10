
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Services/Gets/Controller/StoreController.dart';
class AddFollowerCount extends StatefulWidget {
  AddFollowerCount({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  @override
  State<AddFollowerCount> createState() => _AddFollowerCountState();
}

class _AddFollowerCountState extends State<AddFollowerCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Follower Count'),

      ),
      floatingActionButton:  FloatingActionButton(
          onPressed: (){
            StoreController().updateFollowerCount();
          },
      child: const Icon(Icons.navigate_next),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Text('You have add these many followers to your store',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
                
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(() => Text(
                StoreController().followCount.value.toString(),
                style: const TextStyle(
                  fontSize: 20
                ),


              ),
              ),
              
            ],
          ),
        ),
      ),

    );
  }
}


