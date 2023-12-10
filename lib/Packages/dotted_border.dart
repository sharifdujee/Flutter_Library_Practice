import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class DottedBorderExample extends StatefulWidget {
  const DottedBorderExample({super.key});

  @override
  State<DottedBorderExample> createState() => _DottedBorderExampleState();
}

class _DottedBorderExampleState extends State<DottedBorderExample> {
  Time _time = Time(hour: 11, minute: 30, second: 20);
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
              child:
              Padding(padding: EdgeInsets.all(5.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: <Widget>[
                    rectBorderWidget,
                    rectBorderWithPaddingWidget,
                    roundedRectBorderWidget,
                    // customBorder,
                    // roundStrokeCap,
                    // solidBorder,
                    //fullWidthPath,
                    TextButton(onPressed: (){
                      Navigator.of(context).push(
                        showPicker(
                          context:  context,
                            value: _time,
                            onChange: onTimeChanged,
                          sunrise: const TimeOfDay(hour: 6, minute: 0),
                          sunset: const TimeOfDay(hour: 18, minute: 00),
                          duskSpanInMinutes: 120,
                        )
                      );
                    },
                        child: const Text('Date Night Picker'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElegantNotification.success(
                      title: const Text('Update'),
                        description: Text('Here You Could Update Your Information'),

                    )


                  ],
                ),
              ),
            )),

        );
  }
  Widget get rectBorderWidget {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 200,
        width: 120,
        color: Colors.red,
      ),
    );
  }

  /// Use [DottedBorder.borderPadding] to prevent the border from being drawn outside the widget.
  Widget get rectBorderWithPaddingWidget {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: DottedBorder(
        dashPattern: [8, 4],
        strokeWidth: 8,
        padding: EdgeInsets.all(8),
        borderPadding: EdgeInsets.all(4),
        child: Container(
          height: 200,
          width: 120,
          color: Colors.red.withOpacity(0.5),
        ),
      ),
    );
  }

  /// Draw a border with a rounded rectangular border
  Widget get roundedRectBorderWidget {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 200,
          width: 120,
          color: Colors.amber,
        ),
      ),
    );
  }

  /// Draw a border with custom path border
  Widget get customBorder {
    Path customPath = Path()
      ..moveTo(20, 20)
      ..lineTo(50, 100)
      ..lineTo(20, 200)
      ..lineTo(100, 100)
      ..lineTo(20, 20);

    return DottedBorder(
      customPath: (_) => customPath,
      color: Colors.indigo,
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 220,
        width: 120,
        color: Colors.green.withAlpha(20),
      ),
    );
  }

  /// Set border stroke cap
  Widget get roundStrokeCap {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: Radius.circular(5),
      child: Container(
        height: 200,
        width: 120,
        color: Colors.red,
      ),
    );
  }

  Widget get solidBorder {
    return DottedBorder(
      dashPattern: [4, 3],
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      child: Container(
        color: Colors.green,
        height: 200,
        width: 120,
      ),
    );
  }

  Widget get fullWidthPath {
    return DottedBorder(
      customPath: (size) {
        return Path()
          ..moveTo(0, 20)
          ..lineTo(size.width, 20);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(),
      ),
    );
  }
}
