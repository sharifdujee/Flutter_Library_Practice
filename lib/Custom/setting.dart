
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice/Custom/Radio.dart';
import 'package:practice/Custom/language.dart';
import 'package:practice/Firebase%20CRUD/userregistration.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool lockInBackground = true;
  bool notificationEnabled = true;
  bool fingerPrint = true;
  bool changePassword = true;
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      contentPadding: EdgeInsets.all(20),
      shrinkWrap: true,
      brightness: Brightness.dark,
      physics: const BouncingScrollPhysics(
      ),
      darkTheme: SettingsThemeData(

      ),
      platform: DevicePlatform.android,


      sections: [
        SettingsSection(
          title: const Text("Settings"),
          tiles: [
            SettingsTile(
              title: const Text("Language"),
              value: const Text('English'),
              leading: const Icon(Icons.language),
              trailing: const Icon(Icons.language),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const LanguageScreen()));
              },
            ),
            SettingsTile(
              title: const Text('Radio'),
              value: const Text('Radio Button'),
              leading: const Icon(Icons.roundabout_left_outlined),
              onPressed: (context) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const GroupedButton()));
              },
            ),
          ],
        ),
        SettingsSection(
          title: const Text("Account"),
          tiles: [
            SettingsTile(
              title: const Text(
                "Phone",
              ),
              leading: const Icon(Icons.phone),
            ),
            SettingsTile(title: const Text("Email"),
              leading: const Icon(Icons.email),
            ),
            SettingsTile(title: const Text("Log Out"),
              leading: const Icon(Icons.exit_to_app),
            ),
            SettingsTile.navigation(
                title: const Text("Go To"),
              leading: const Icon(Icons.navigation),
              
            ),
            SettingsTile.switchTile(title: const Text("Switch"),
              onToggle: (value){},
              initialValue: true,
              leading: const Icon(Icons.switch_access_shortcut),
            ),
            
          ],
        ),
        SettingsSection(tiles: [
          SettingsTile.switchTile(
              title: const Text("Lock App in Background"),
              leading: const Icon(Icons.phone_locked),
            initialValue: lockInBackground,
            onToggle: (bool value){
                setState(() {
                  lockInBackground = value;
                });

            },
          ),
          SettingsTile.switchTile(
              title: const Text("Finger print"),
            leading: const Icon(Icons.fingerprint),
            initialValue: fingerPrint,
            onToggle: (bool value){
              setState(() {
                fingerPrint = value;
              });
            },
          ),
          SettingsTile.switchTile(title: const Text('Change Password'),
            leading: const Icon(Icons.lock),
            initialValue: changePassword,
            onToggle: (bool value){
            setState(() {
              changePassword = value;
            });
            },
          ),
          SettingsTile.switchTile(title: const Text("Enable Notification"),
            leading: const Icon(Icons.notifications_active),
            initialValue: notificationEnabled,
            onToggle: (bool value){
            setState(() {
              notificationEnabled = value;
            });
            },
          ),
          SettingsTile.switchTile(title: const Text('Switch Theme'),
            leading: const Icon(Icons.format_paint),
            initialValue: true,
              onToggle: (value){},
          )
        ]
        ),
        SettingsSection(
          title: const Text("Misc"),
            tiles: [
              SettingsTile(title: const Text('Terms of Service'),
                leading: const Icon(Icons.description),
              ),
              SettingsTile(title: const Text('Open Source Licenses'),
              leading: const Icon(Icons.collections_bookmark),)
          
        ]
        ),

      ],
    );
  }
  Widget _mBuildsettingList(){
    return SettingsList(
        sections: [
      SettingsSection(tiles: [

        SettingsTile(title: const Text('Default Home Page'))
        

      ]
      )
    ]);
  }
}
