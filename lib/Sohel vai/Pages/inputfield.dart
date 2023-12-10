import 'package:flutter/material.dart';
class MyInputField1 extends StatelessWidget{
  const MyInputField1 ({Key?key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.widget
  }) : super(key: key);
  final String title;
  final String hint;
  final TextEditingController controller;
  final Widget widget;

  @override
  Widget build (BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment:   CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 5.0),
            decoration:   BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 4.0,

              ),
              borderRadius: BorderRadius.circular(12.0)

            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      readOnly: widget ==null? false: true,
                      autofocus: false,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hint,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 0,
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 0
                          ),
                        )
                      ),
                    ),
                ),
                widget == null? Container(): Container(child: widget,)
              ],

            ),

          )
        ],
      ),
    );
  }
}


