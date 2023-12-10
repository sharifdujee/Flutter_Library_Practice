
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Services/Gets/Controller/StoreController.dart';

class StoreStatus extends StatefulWidget {
   StoreStatus({Key? key}) : super(key: key);
   final storeController = Get.put(StoreController());

  @override
  State<StoreStatus> createState() => _StoreStatusState();
}

class _StoreStatusState extends State<StoreStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Status Toggle'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('The Store is Open',
              style: TextStyle(
                fontSize: 48
              ),
              ),
              Obx(() => Switch(
                  value: StoreController().storeStatus.value,
                  onChanged: (value) =>  StoreController().storeStatus(value),
                  activeColor: Colors.green,

                  ))
            ],
          ),
        ),
      ),

    );
  }
}
