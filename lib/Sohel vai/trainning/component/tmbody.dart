import 'package:flutter/material.dart';

class TMBody extends StatefulWidget {
  const TMBody({Key? key}) : super(key: key);

  @override
  State<TMBody> createState() => _TMBodyState();
}

class _TMBodyState extends State<TMBody> {

  final String _imgTeachingSchedule = "images/schedule.png";
  final String _imgTraineeInformation = "images/trainee_information.png";
  final String _imgTraineeManagement = "images/trainee_management.png";
  final String _imgTraineeActivities = "images/trainee_activities.png";
  final String _imgTrainingCost = "images/training_cost.png";

  final String _cardTitleTxtTrainingSchedule = "Schedule";
  final String _cardTitleTxtTraineeInformation = "Information";
  final String _cardTitleTxtTraineeManagement = "Management";
  final String _cardTitleTxtTrainingActivities = "Activities";
  final String _cardTitleTxtTrainingCost = "Cost";

  Widget _mCustomCard(String _cardImage, String _cardTitleTxt, int _cardIndex) {
    return Column(
      children: [
        GestureDetector(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    _cardImage,
                    scale: 8,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  //color: Colors.blue,
                  child: Center(
                    child: Text(
                      _cardTitleTxt,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () => cardSelectDestination(_cardIndex),
        ),
      ],
    );
  }

  Widget _mBodyTM() {
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 2,
      children: [
        _mCustomCard(_imgTeachingSchedule, _cardTitleTxtTrainingSchedule, 1),
        _mCustomCard(_imgTraineeInformation, _cardTitleTxtTraineeInformation, 2),
        _mCustomCard(_imgTraineeManagement, _cardTitleTxtTraineeManagement, 3),
        _mCustomCard(_imgTraineeActivities, _cardTitleTxtTrainingActivities, 4),
        _mCustomCard(_imgTrainingCost, _cardTitleTxtTrainingCost, 5),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return _mBodyTM();
  }

  void cardSelectDestination(int _cardIndex) {
    _showSnackBar("Card Index: " + _cardIndex.toString());
    switch (_cardIndex) {
      case 1:
        {
          //Navigator.pushNamed(context, Attendance.routeName);
        }
        break;
      case 2:
        {}
        break;
      case 3:
        {}
        break;
      case 4:
        {}
        break;
      case 5:
        {}
        break;
      case 6:
        {}
        break;
      case 7:
        {}
        break;
      case 11:
        {}
        break;
      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  _gridView(){
    return Container(
      //margin: EdgeInsets.only(top: 100, left: 16, right: 16),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
        children: [
          _mCustomCard(_imgTeachingSchedule, _cardTitleTxtTrainingSchedule, 1),
          _mCustomCard(_imgTraineeInformation, _cardTitleTxtTraineeInformation, 2),
          _mCustomCard(_imgTraineeManagement, _cardTitleTxtTraineeManagement, 3),
          _mCustomCard(_imgTraineeActivities, _cardTitleTxtTrainingActivities, 4),
          _mCustomCard(_imgTrainingCost, _cardTitleTxtTrainingCost, 5),
        ],
      ),
    );
  }
}

