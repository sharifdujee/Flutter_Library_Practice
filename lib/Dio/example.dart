// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// class DtoExample extends StatefulWidget {
//   const DtoExample({super.key});
//
//   @override
//   State<DtoExample> createState() => _DtoExampleState();
// }
//
// class _DtoExampleState extends State<DtoExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DTO"),
//       ),
//     );
//   }
// }
// //Main Method
// void main () async{
//   final dio = Dio();
//   final response = await dio.get('https://pub.dev');
//   print(response.data);
// }
// //Get Http
// final dio = Dio();
// void getHttp() async {
//   final response = await dio.get('https://dart.dev');
//   print(response);
//
// }
// // Query for GET
// final dio1 = Dio();
// void request() async{
//   Response response;
//   response = await dio.get('/test?id=12&name=dio');
//   print(response.data.toString());
//   response = await dio.get('/test', queryParameters: {'id': 12, 'name': 'dio'});
//   print(response.data.toString());
//   // post Method
//   response =  await dio.post('/test', data: {'id': 12, 'name': 'dio'});
//
//   // Multiple Request
//   response = (await Future.wait([dio.post('/info'), dio.get('/test1')])) as Response;
//
//   // Download File
//   response = await dio.download('https://pub.dev/',
//       (
//       await getTemporaryDirectory()).path + 'pub.html'
//       );
//
// // Uploading Multiple Files
//   final formData = FromData.fromMap
//
// //Get Response Stream
//   final rs = await dio.get(
//     url,
//     options: Options(responseType: ResponseType.stream)
//   );
//   print(rs.data.stream);
//
// }
//
//
//
//
//
//
//
