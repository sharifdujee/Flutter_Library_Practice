
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:practice/Services/Gets/Controller/StoreController.dart';

class StoreBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => StoreController());
  }
}