import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:practice/Firebase%20CRUD/userregistration.dart';

class GroupedButton extends StatelessWidget {
  const GroupedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grouped Button Example'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('User Registration'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const UserRegistration()));
        },
        icon: const Icon(Icons.radio_button_checked),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Horizontal',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Shape Disabled',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCheckBoxGroup<String>(
                      // scrollController: ScrollController(),
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: const [
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                      ],
                      disabledValues:  const[
                        "Monday",
                      ],
                      buttonValuesList:  const[
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                      ],
                      checkBoxButtonValues: (values) {
                        print(values);
                      },
                      defaultSelected: const ["Monday"],
                      horizontal: true,
                      width: 120,
                       height: 50,
                      selectedColor: Theme.of(context).colorScheme.secondary,
                      padding: 5,
                      spacing: 0.0,
                      // enableShape: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Shape Enabled',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCheckBoxGroup(
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables:  const [
                        "Thursday Thursday Thursday Thursday",
                        "Friday",
                        "Saturday",
                        "Sunday",
                      ],
                      buttonValuesList: const  [
                        "Thursday",
                        "Friday",
                        "Saturday",
                        "Sunday",
                      ],
                      checkBoxButtonValues: (values) {
                        print(values);
                      },
                      defaultSelected: const  ["Sunday"],
                      horizontal: true,
                      width: 120,
                      height: 50,
                      selectedColor: Theme.of(context).colorScheme.secondary,
                      padding: 5,
                      enableShape: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Vertical',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                 const  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Shape Disabled',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCheckBoxGroup(
                    buttonTextStyle: const ButtonTextStyle(
                      selectedColor: Colors.pinkAccent,
                      unSelectedColor: Colors.orange,
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                      selectedTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables:  const [
                      "M",
                      "T",
                      "W",
                      "T",
                      "F",
                      "S",
                      "S",
                    ],
                    disabledValues: const  [
                      "Monday",
                    ],
                    buttonValuesList:  const [
                      "Monday",
                      "Tuesday",
                      "Wednesday",
                      "Thursday",
                      "Friday",
                      "Saturday",
                      "Sunday",
                    ],
                    checkBoxButtonValues: (values) {
                      print(values);
                    },
                    spacing: 0,
                    defaultSelected: const ["Monday"],
                    horizontal: false,
                    enableButtonWrap: false,
                    width: 40,
                    absoluteZeroSpacing: false,
                    selectedColor: Theme.of(context).colorScheme.secondary,
                    padding: 10,
                    // enableShape: true,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Shape Enabled and Wrap enabled',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCheckBoxGroup(
                    buttonTextStyle: const ButtonTextStyle(
                      selectedColor: Colors.white,
                      unSelectedColor: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    autoWidth: false,
                    enableButtonWrap: true,
                    wrapAlignment: WrapAlignment.center,
                    unSelectedColor: Theme.of(context).canvasColor,
                    buttonLables:  const [
                      "Monday Monday Mondays",
                      "Tuesday",
                      "Wednesday",
                      "Thursday",
                      "Friday",
                      "Saturday",
                      "Sunday",
                    ],
                    buttonValuesList: const  [
                      "Monday",
                      "Tuesday",
                      "Wednesday",
                      "Thursday",
                      "Friday",
                      "Saturday",
                      "Sunday",
                    ],
                    checkBoxButtonValues: (values) {
                      print(values);
                    },
                    defaultSelected: const ["Sunday"],
                    horizontal: false,
                    width: 120,
                    height: 100,
                    selectedColor: Theme.of(context).colorScheme.secondary,
                    padding: 5,
                    enableShape: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

    );
  }
}