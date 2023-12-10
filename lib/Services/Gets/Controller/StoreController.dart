
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StoreController extends GetxController{
  final storeName = 'Thick shock'.obs;
  final followCount = 5.obs;
  final storeStatus = true.obs;
  final followerList = [].obs;
  final reviews = <StoreReviews> [].obs;

  final nameEditingController = TextEditingController();
  final reviewEditingController = TextEditingController();
  final followerEditingController = TextEditingController();
  final reviewNameController = TextEditingController();


  // Method
    updateStoreName (String name){
      storeName(name);
    }

    updateFollowerCount(){
      followCount(followCount.value+1);
    }
    void storeStatusOpen (bool isOpen){
      storeStatus(isOpen);
    }

}
int storeFollowerCount = 0;
void increment(){
  storeFollowerCount++;
  update();

}

void update() {
}

class StoreReviews {

}