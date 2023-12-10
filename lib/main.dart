import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/Chart/Linechart.dart';
import 'package:practice/Chart/barchart.dart';
import 'package:practice/Chart/data/LineChart.dart';
import 'package:practice/Chart/data/piechart.dart';
import 'package:practice/Chart/data/price.dart';
import 'package:practice/Chart/data/sector.dart';
import 'package:practice/Controller/webview.dart';
import 'package:practice/Custom/Radio.dart';
import 'package:practice/Custom/setting.dart';
import 'package:practice/Dio/example.dart';
import 'package:practice/Firebase%20CRUD/userregistration.dart';
import 'package:practice/Hive/show.dart';
import 'package:practice/Images/Example.dart';
import 'package:practice/Images/cachedNetworkImage.dart';
import 'package:practice/Images/photoview.dart';
import 'package:practice/Map/google_map.dart';
import 'package:practice/Messaging/message.dart';
import 'package:practice/Messaging/notification.dart';
import 'package:practice/Packages/bottom_sheet.dart';
import 'package:practice/Packages/dotted_border.dart';
import 'package:practice/Packages/elegant_notification.dart';
import 'package:practice/Packages/grouped_list.dart';
import 'package:practice/Packages/modal_bottom_sheet.dart';
import 'package:practice/Rington/Alarm.dart';
import 'package:practice/Rington/Examples.dart';
import 'package:practice/Services/Gets/service/view.dart';
import 'package:practice/Services/Gets/Binding/storeBinding.dart';
import 'package:practice/Services/Gets/service/Add.dart';
import 'package:practice/Services/Gets/service/storestatus.dart';
import 'package:practice/Services/Gets/service/view.dart';
import 'package:practice/Sohel%20vai/Dashboard/dashboard.dart';
import 'package:practice/Sohel%20vai/trainning/trainingManagement.dart';
import 'package:practice/Voice/agora.dart';
import 'package:practice/Voice/check.dart';
import 'package:practice/Voice/example.dart';
import 'package:practice/WebView/example.dart';
import 'package:practice/Youtube%20VideoPlayer/Example.dart';
import 'package:practice/Youtube%20VideoPlayer/youtubevideo.dart';
import 'package:practice/database/data.dart';
import 'package:practice/firebase_options.dart';
import 'package:practice/gesturdector.dart';
import 'package:practice/gestures.dart';
import 'package:practice/spinkit/example.dart';
import 'package:practice/spinkit/onlineExample.dart';

import 'Chart/data/sector.dart';
import 'Chart/data/sector.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FlexColorScheme.light(scheme: FlexScheme.red).toTheme;
    final darkTheme = FlexColorScheme.dark(scheme: FlexScheme.red).toTheme;
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding:  StoreBinding(),
      theme: theme,
      darkTheme: darkTheme,

      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // TRY THIS: Try running your application with "flutter run". You'll see
      //   // the application has a purple toolbar. Then, without quitting the app,
      //   // try changing the seedColor in the colorScheme below to Colors.green
      //   // and then invoke "hot reload" (save your changes or press the "hot
      //   // reload" button in a Flutter-supported IDE, or press "r" if you used
      //   // the command line to start the app).
      //   //
      //   // Notice that the counter didn't reset back to zero; the application
      //   // state is not lost during the reload. To reset the state, use hot
      //   // restart instead.
      //   //
      //   // This works for code too, not just values: Most code changes can be
      //   // tested with just a hot reload.
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
     // home: const MyApps(),
      //home:  const VoiceCommunication(),
      //home: const VideoPlayer(),
      //home:  YoutubePlayerDemoApp(),
      //home: const MyApp1(),
      //home: const Alarm(),
      //home: const ImageShow()
     // home: const BasicContent()
      //home: const LauncherIcon(),
      //home: const PhotoViews()
      //home: const WebViewExample(),
      //home: const DtoExample()
      //home: const App(),
     // home: const OnlineExample(),
     //home:  const UserRegistration(),
     // home: const FirebaseMessage(),
      //home:  MessagingExampleApp()
      //home:  const ShowHiveData(),
      //home:  AddFollowerCount()
      //home: const LineChartView(),
      //home:   BarChartWidget(),
      //home:  StoreStatus(),
     // home :  PieChartWidget(industrySector),
    //home:   BarChartWidget(points: [PricePoint(x: 0, y: 0)]),
    // home:  LineChartWidget(pricePoints),
      //home :  Views(),
      //home: MapSample(),
     // home: const GroupedButton(),
      //home: const Settings(),
      //home: const Dashboard(),
      //home:  const  GestureDetectorExamples1(),
      //home : const TrainingManagement(),
     // home: const PinCodeVerificationScreen(),
      //home: const BottomSheetExample(),
     // home: const DottedBorderExample(),
      //home: const ExampleApp(),
      home: const GroupedList(),




    );
  }
}

