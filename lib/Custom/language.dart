import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int languageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language Screen"),
        centerTitle: true,
        elevation: 0,
      ),
          body: SettingsList(
      sections: [
        SettingsSection(tiles: [
          SettingsTile(
              title: const Text("English"),
            trailing: trailingWidget(0),
            onPressed:(BuildContext context){
                _changeLanguage(0);
            } ,
          ),
          SettingsTile(
            title: const Text("Bengali"),
           // trailing: trailingWidget(1),
            trailing: trailingWidget(0),
            onPressed: (BuildContext context){
            _changeLanguage(1);
            },
          ),
          SettingsTile(
              title: const Text("Spanish"),
            // trailing:trailingWidget(2) ,
            trailing: trailingWidget(0),
            onPressed: (BuildContext context){
                _changeLanguage(2);
            },
          ),
          SettingsTile(
              title: const Text("German"),
            //trailing: trailingWidget(3),
            trailing: trailingWidget(0),
            onPressed: (BuildContext context){
                _changeLanguage(3);
            },
          )

          
          
        ]
        ),

        ],
    ),
    );
  }
  Widget trailingWidget( int index){
    return(languageIndex == index)
        ?  const Icon(Icons.check,
      color: Colors.blueAccent)
      : const Icon(null);


  }
  void _changeLanguage (int index){
    setState(() {
      languageIndex = index;
    });

  }
}
