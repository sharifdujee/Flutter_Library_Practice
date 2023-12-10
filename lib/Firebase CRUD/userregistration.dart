import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:uuid/uuid.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling Background Message ${message.messageId}');
}

void main() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Got a Message");
    print('Message Data ${message.data}');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  File? profilePicture;

  final TextEditingController _userId = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  CarouselController buttonCarousalController = CarouselController();
  Uint8List? imageData;
  Color emailBorderColor = Colors.blueGrey;

  Future<void> loadImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        imageData = Uint8List.fromList(imageBytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Registration Form"),
      ),
      drawer: Container(
        color: Colors.green,
        child: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/img_1.png'),
                  ),
                  accountName: Text('MD Sharif Hossain'),
                  accountEmail: Text('sharifdu44@gmail.com'))
            ],
          ),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(5.00)),
                  //image Upload via camera or gallery use selection process
                  // const Text('Please Select an Image'),
                  // if (imageData != null)
                  //   Image.memory(
                  //     imageData!,
                  //     width: 100,
                  //     height: 100,
                  //     fit: BoxFit.cover,
                  //   )
                  // else
                  //   Center(
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 20,
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             ElevatedButton(
                  //               onPressed: () =>
                  //                   loadImage(ImageSource.camera),
                  //               child: const Text('Camera'),
                  //             ),
                  //             const SizedBox(width: 20.0),
                  //             ElevatedButton(
                  //               onPressed: () =>
                  //                   loadImage(ImageSource.gallery),
                  //               child: const Text('Gallery'),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //Image Upload use recuperation Icon Button

                  CupertinoButton(
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage: (profilePicture != null)
                              ? FileImage(profilePicture!)
                              : null,
                          backgroundColor: Colors.grey),

                      onPressed: () async {
                        XFile? selectedImage = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (selectedImage != null) {
                          File convertedFile = File(selectedImage!.path);
                          setState(() {
                            profilePicture = convertedFile;
                          });
                          log("Image was Selected");
                        } else {
                          log("No Image Was Selected");
                        }
                      }),

                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _userId,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.app_registration),
                      labelText: 'User Id',
                      hintText: 'Enter a Unique Id ',
                      border: OutlineInputBorder(),
                      // errorText: 'Follow The Instruction'
                    ),
                  ),
                  const Gap(20,
                  ),
                  SvgPicture.asset(
                      'images/success.svg',
                    semanticsLabel: 'SVG Example',
                    height: 70,
                    width: 50,
                  ),
                  const Gap(8),
                  SvgPicture.asset('images/map.svg',
                    height: 150,
                    width: 150,
                  ),
                  const  Gap(8),
                  SvgPicture.asset('images/user.svg'),
                  const Gap(8),



                  TextField(
                    controller: _userName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.verified_user),
                        labelText: 'User Name',
                        hintText: 'Enter Your user name'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: emailValidation,
                    onChanged: (value) {
                      setState(() {
                        if (emailValidation(value) == null) {
                          emailBorderColor = const Color(0xFFE91e63);
                        } else {
                          emailBorderColor = Colors.grey.shade800;
                        }
                      });
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp("[0-9@a-zA-Z.]")),
                    ],
                    autocorrect: false,
                    controller: _email,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Enter a Valid Email Address',
                      fillColor: Colors.yellowAccent,
                      filled: true,
                    ),
                  ),
                  // MaterialButton(
                  //     onPressed: (() => validate(_email.text)),
                  //   child: const Text('Check'),
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  IntlPhoneField(
                    initialCountryCode: 'BD',
                    controller: _phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      labelText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: _dob,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                      labelText: "Date of Birth",
                      hintText: 'Please Select Your DOB',
                    ),
                    onTap: () async {
                      DateTime? dob = await showDatePicker(
                        context: context,
                        initialDate: DateTime(1950),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2023),
                      );
                      if (dob != null) {
                        setState(() {
                          _dob.text = DateFormat('MM-dd-yyyy').format(dob);
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userSignUp();
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ToggleSwitch(
                    minWidth: 100,
                    minHeight: 50,
                    fontSize: 16.0,
                    activeBgColor: const [Colors.greenAccent],
                    activeFgColor: Colors.red,
                    inactiveBgColor: Colors.yellow,
                    inactiveFgColor: Colors.deepOrange,
                    cornerRadius: 40,
                    initialLabelIndex: 0,
                    icons:  const [
                      FontAwesomeIcons.mars,
                      FontAwesomeIcons.venus,
                      FontAwesomeIcons.addressBook,
                      FontAwesomeIcons.addressCard,
                      FontAwesomeIcons.camera
                    ],
                    totalSwitches: 5,
                    borderWidth: 4,
                    borderColor: const [
                      Color(0xff3b5998),
                      Color(0xff8b9dc3),
                      Color(0xff00aeff),
                      Color(0xff0077f2),
                      Color(0xff962fbf),
                      Color(0xff4f5bd5)
                    ],
                    radiusStyle: true,
                    animate: true,
                    animationDuration: 1000,
                    curve: Curves.bounceInOut,
                    iconSize: 50,
                    labels: const ['DU', 'RU', 'CU', 'JU', "NSTU"],
                    onToggle: (index) {
                      print('Switched To $index');
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(height: 400),
                    items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: Text(
                            'Text $i',
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  const Divider(),
                  TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 12, 31),

                    // selectedDayPredicate: (day){
                    // return isSameDay(_selectedDay, day);
                    // },
                    // onDaySelected: (selectedDay, focusDay){
                    // setState(() {
                    //   _selectedDay = selectedDay;
                    //   _focusDay = focusDay;
                    // });
                    // },
                    // calendarFormat: _calendarFormat,
                    // onFormatChanged: (format) {
                    //   setState(() {
                    //     _calendarFormat = format;
                    //   });
                    // },
                    // onPageChanged: (focusedDay) {
                    //   _focusedDay = focusedDay;
                    // },
                  ),
                  Gap(20),

                  CustomRadioButton(
                    elevation: 5,
                    buttonLables: const ['Teacher', 'House Tutor'],
                    buttonValues: const ["Teacher", "Home Tutor"],
                    radioButtonValue: (value) {
                      print(value);
                    },
                    unSelectedColor: Colors.yellow,
                    selectedColor: Colors.green,
                  ),
                  CustomCheckBoxGroup(
                    buttonTextStyle: const ButtonTextStyle(
                        textStyle: TextStyle(
                      fontSize: 20,
                    )),
                    spacing: 2,
                    defaultSelected: const ['Monday'],
                    horizontal: false,
                    enableButtonWrap: true,
                    enableShape: true,
                    absoluteZeroSpacing: false,
                    width: 80,
                    padding: 10,
                    buttonValuesList: const [
                      'Saturday',
                      'Sunday',
                      "Monday",
                      "Tuesday",
                      "Wednesday",
                      'Thursday',
                      'Friday'
                    ],
                    buttonLables: const [
                      'Sa',
                      'Su',
                      "Mo",
                      "Tu",
                      "We",
                      "Th",
                      'Fr'
                    ],
                    checkBoxButtonValues: (value) {
                      print(value);
                    },
                    selectedColor: Colors.green,
                    unSelectedColor: Colors.cyan,
                  ),
                  Gap(10),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Firebase Save Method
  void userSignUp() async {
    try {
      String userid = _userId.text.trim();
      String username = _userName.text.trim();
      String email = _email.text.trim();
      String phone = _phone.text.trim();
      String dob = _dob.text.trim();
      String? emailValidationResult = emailValidation(email);
      if (emailValidationResult != null) {
        // Show a Snackbar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(emailValidationResult),
          ),
        );
        return; // Stop execution if email is not valid
      }

      int id = int.parse(userid);
      int contact = int.parse(phone);

      _userId.clear();
      _userName.clear();
      _email.clear();
      _phone.clear();
      _dob.clear();
//image upload

      if (userid != "" && username != "" && profilePicture != null) {
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child('profilePictures')
            .child(const Uuid().v1())
            .putFile(profilePicture!);
        TaskSnapshot taskSnapshot = await uploadTask;
        StreamSubscription taskSubscription =
            uploadTask.snapshotEvents.listen((snapshot) {
          double percentage =
              snapshot.bytesTransferred / snapshot.totalBytes * 100;
          log(percentage.toString());
        });
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        taskSubscription.cancel();
        Map<String, dynamic> registeredUser = {
          'User Id': userid,
          'User Name': username,
          'Email': email,
          'Phone Number': contact,
          'Date of Birth': dob,
          'Profile Picture': downloadUrl,
          'UserArray': [userid, username, email, contact, dob, downloadUrl],
        };

        FirebaseFirestore.instance.collection("User").add(registeredUser);

        // Show a SnackBar or handle success as needed
        // Note: This code doesn't currently show the SnackBar, you might need to implement it differently.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Your Registration is Success!"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please Fill all The Field"),
          ),
        );
      }
      setState(() {
        profilePicture = null;
      });
    } catch (e) {
      // Handle and log the exception
      print('Error during user registration: $e');

      // You might want to show an error message to the user here.
      // For example, you could show a SnackBar with an error message.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred during registration."),
        ),
      );
    }
  }
}

// Email Validation using Build in Flutter Package
void validate(String emails) {
  bool isValid = EmailValidator.validate(emails);
  print(isValid);
}

String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter an email address';
  }

  bool isValid = EmailValidator.validate(value);
  if (!isValid) {
    return 'Enter a valid email address';
  }

  return null; // Indicates that the email is valid
}

// Email Validation Using RegExp
String? emailValidation1(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  return value!.isEmpty || !regex.hasMatch(value)
      ? 'Enter a Valid Email Address'
      : null;
}

//
// import 'dart:ffi';
// import 'dart:typed_data';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//

//

//
// class UserRegistration extends StatefulWidget {
//   const UserRegistration({super.key});
//
//   @override
//   State<UserRegistration> createState() => _UserRegistrationState();
// }
//
// class _UserRegistrationState extends State<UserRegistration> {
//   @override
//   void getInitializeMessage() async {
//     RemoteMessage? message =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (message != null) {
//       if (message.data['User'] == 'Email') {
//         Navigator.push(
//           context,
//           CupertinoPageRoute(builder: (context) => UserRegistration()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(message.data['myname'].toString()),
//           duration: Duration(seconds: 10),
//           backgroundColor: Colors.green,
//         ));
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getInitializeMessage();
//     FirebaseMessaging.onMessage.listen((message) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(message.data['myname'].toString()),
//         duration: const Duration(seconds: 10),
//         backgroundColor: Colors.green,
//       ));
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('App is Opend by Notification'),
//         duration: Duration(seconds: 10),
//         backgroundColor: Colors.green,
//       ));
//     });
//   }
//
//   final TextEditingController _userId = TextEditingController();
//   final TextEditingController _userName = TextEditingController();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _phone = TextEditingController();
//   TextEditingController _dob = TextEditingController();
//   Future<void> loadImage(ImageSource source ) async {
//     final pickedFile =
//     await ImagePicker().pickImage(source: source);
//
//     if (pickedFile != null) {
//       final imageBytes = await pickedFile.readAsBytes();
//       setState(() {
//         imageData = Uint8List.fromList(imageBytes);
//       });
//     }

//               // StreamBuilder<QuerySnapshot>(
//               //   stream: FirebaseFirestore.instance.collection('User').snapshots(),
//               //   builder: (context, snapshots) {
//               //     if (snapshots.connectionState == ConnectionState.active) {
//               //       if (snapshots.hasData && snapshots.data != null) {
//               //         return SingleChildScrollView(
//               //           child: Column(
//               //             children: <Widget>[
//               //               SizedBox(
//               //                 height: 200,
//               //                 child: ListView.builder(
//               //                   shrinkWrap: true,
//               //                   itemCount: snapshots.data!.docs.length,
//               //                   itemBuilder: (context, index) {
//               //                     Map<String, dynamic> userMap =
//               //                     snapshots.data!.docs[index].data()
//               //                     as Map<String, dynamic>;
//               //                     return ListTile(
//               //                       // The Field Name Must Be Match With Firebase Field
//               //                       title: Text("User Id: " + userMap['User Id']),
//               //                       subtitle: Column(
//               //                         children: [
//               //                           Text("User Name : " + userMap['User Name']),
//               //                           Text("Email: " + userMap['Email']),
//               //                           Text("Phone:" +
//               //                               userMap['Phone Number'].toString()),
//               //                           Text("Date of birth" +
//               //                               userMap['Date of Birth'])
//               //                         ],
//               //                       ),
//               //                       trailing: Column(
//               //                         children: [
//               //                           IconButton(
//               //                             onPressed: () {
//               //                               setState(() {
//               //                                 userUpdate();
//               //                               });
//               //                             },
//               //                             icon: Icon(Icons.edit),
//               //                           ),
//               //                           IconButton(
//               //                             onPressed: () {
//               //                               setState(() {
//               //                                 deleteUser();
//               //                               });
//               //                             },
//               //                             icon: Icon(Icons.delete),
//               //                           )
//               //                         ],
//               //                       ),
//               //                     );
//               //                   },
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         );
//               //       } else {
//               //         return Text('No Data Found');
//               //       }
//               //     } else {
//               //       return Center(
//               //         child: CircularProgressIndicator(),
//               //       );
//               //     }
//               //   },
//               // ),
//
//
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Save

//
//   // Delete
//
//   void deleteUser() async {
//     await FirebaseFirestore.instance
//         .collection('User')
//         .doc('yvVvJ06NTKTlrdiY82j5')
//         .delete();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("The User is Successfully Deleted"),
//       ),
//     );
//   }
//
//   // update
//   void userUpdate() async {
//     print("Updating user...");
//     try {
//       await FirebaseFirestore.instance
//           .collection('User')
//           .doc('hXA1sYEnlLvtVKuRSePp')
//           .update({
//         // The Field Name Must Be Match With Firebase Field
//         'User Name': 'Selim Munira Rayhan',
//         'Email': 'selimmmmra@gmail.com'
//       });
//       print("User successfully updated!");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("The User is Successfully Updated"),
//         ),
//       );
//     } catch (e) {
//       print("Error updating user: $e");
//       // Handle the error appropriately
//     }
