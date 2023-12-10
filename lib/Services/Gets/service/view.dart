import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:practice/Services/Gets/Controller/StoreController.dart';

class Views extends GetView<StoreController> {
  const Views({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX Store',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      'Store Name',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        controller.storeName.value.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      'Store Count',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        controller.followCount.value.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      'Store Status',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Obx(() => Flexible(
                        child: Text(
                          controller.storeStatus.value.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.storeStatus.value
                                ? Colors.green.shade700
                                : Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  const Flexible(child: Text('Status')),
                  const SizedBox(
                    height: 20,
                  ),
                  GetX<StoreController>(
                    builder: (sController) => Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        sController.storeStatus.value ? 'Open' : 'Closed',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: sController.storeStatus.value
                                ? Colors.green.shade700
                                : Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GetBuilder<StoreController>(
                    builder: (newController) => Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        newController.followCount.toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      'First Impression',
                      'Welcome to Circle Technology. We Work With Non-Government Organization',
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                      backgroundColor: Colors.orange,
                    );
                  },
                  child: const Text("Welcome")),
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      radius: 10.0,
                      contentPadding: const EdgeInsets.all(10),
                      title: 'Confirmation',
                      middleText: 'Above Information is Correct',
                      textConfirm: 'Okay',
                      textCancel: 'No',
                      cancelTextColor: Colors.red,
                      confirmTextColor: Colors.green,
                      confirm: OutlinedButton.icon(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.check,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          'Okay',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                      cancel: OutlinedButton.icon(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.cancel),
                        label: const Text('Cancel'),
                      ));
                },
                child: const Icon(Icons.check_circle),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    color: Colors.blueGrey,
                    height: 300,
                    child: const Center(
                      child: Text(
                        ''
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ));
                },
                child: const Icon(Icons.dialpad_outlined),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                maxRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.00),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              RatingBar(
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: const Image(image: AssetImage('images/img_1.png')),
                  half: const Image(image: AssetImage('images/img_2.png')),
                  empty: const Image(image: AssetImage('images/img_2.png')),
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.00),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
          RatingBar.builder(
            initialRating: 3,
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
              }
              return Icon(Icons.add);

            },
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
              RatingBarIndicator(
                rating: 1.75,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color:  Colors.amber,

                  ),
                itemCount: 5,
                itemSize: 50,
                direction: Axis.horizontal,
              ),

              // LineChart(
              //   LineChartData(
              //     borderData: FlBorderData(show: false),
              //     lineBarsData: [
              //       LineChartBarData(
              //         spots: chartData, // Assuming chartData is a List<FlSpot>
              //       ),
              //     ],
              //   ),
              // )



            ],
          ),
        ),
      ),
    );
  }
}

List<FlSpot> chartData = [
  FlSpot(0, 1),
  FlSpot(1, 3),
  FlSpot(2, 10),
  FlSpot(3, 7),
  FlSpot(4, 12),
  FlSpot(5, 13),
  FlSpot(6, 17),
  FlSpot(7, 15),
  FlSpot(8, 20 / 0), // Division by zero, which will result in Infinity
];


