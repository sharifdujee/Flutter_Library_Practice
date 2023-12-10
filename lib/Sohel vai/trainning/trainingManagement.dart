import 'package:flutter/material.dart';
import 'package:practice/Sohel%20vai/trainning/component/tmbody.dart';
class TrainingManagement extends StatefulWidget {
  const TrainingManagement({Key? key}): super(key: key);

  @override
  State<TrainingManagement> createState() => _TrainingManagementState();
}

class _TrainingManagementState extends State<TrainingManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Management"),
      ),
      body: const TMBody(),
    );
  }
}
