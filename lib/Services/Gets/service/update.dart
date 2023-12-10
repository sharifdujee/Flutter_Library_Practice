import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Services/Gets/Controller/StoreController.dart';
class UpdateStoreName extends StatelessWidget {
   UpdateStoreName ({Key? key}): super(key: key);
   final storeController = Get.find<StoreController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: storeController.nameEditingController,
            decoration: const InputDecoration(
              hintText: 'Store Name'
            ),
          ),
          ElevatedButton(onPressed: (){
            storeController.updateStoreName(
              storeController.nameEditingController.text
            );
            Get.snackbar('Updated',
                'Store name has been updated ton '
                '${storeController.nameEditingController.text}',
                snackPosition: SnackPosition.BOTTOM);
          }, child: const Padding(
              padding: EdgeInsets.all(16.0),
            child: Text('Updated',
              style: TextStyle(
                fontSize: 20
              ),
            ),


          )
          )
        ],
      ),
    );
  }
}
