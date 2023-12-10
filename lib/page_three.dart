// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class PageThree extends StatefulWidget{
//   const PageThree ({Key?key}) : super(key: key)
//   @override
//   _PageThreeState createState () {
//     return _PageThreeState();
//   }
// }
// class _PageThreeState extends State <PageThree>{
//   @override
//   void initState(){
//     super.initState;
//   }
//   @override
//   Widget build (BuildContext context){
//     final args = ModalRoute.of(context)!var settings;
// settings.arguments as UserInput;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             child: Text("Email: "+(args!=null ? args.email.toString():"null").toString()),
//           ),
//           Container(
//             child: Text("Password:" + (args!=null?args.password.toString():"null").toString()),
//           ),
//           Container(
//             child: Center(
//               child: ElevatedButton(onPressed: (){
//                 Navigator.pop(context);
//               },
//                   child: const Text("Back To Login ")),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
// }