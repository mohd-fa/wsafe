import 'package:wsafe/screens/profileedit.dart';
import 'package:wsafe/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    String name = auth.currentUser?.displayName ?? '';
    final email = auth.currentUser?.email ?? '';

    return SettingsList(
      lightTheme: SettingsThemeData(
          titleTextColor: Colors.red, settingsListBackground: Colors.red[100]),
      sections: [
        SettingsSection(
          title: const Text('Profie'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              title: const Text('Name'),
              trailing: Text(name),
            ),
            SettingsTile.navigation(
                title: const Text('Email'), trailing: Text(email)),
            SettingsTile.navigation(
                title: const Text('Edit Profile'),
                leading: const Icon(Icons.edit),
                onPressed: (ctx) {
                  Navigator.push(
                          ctx,
                          MaterialPageRoute(
                              builder: ((context) => ProfileEdit())))
                      .then((value) => setState(() {
                            name = auth.currentUser?.displayName ?? '';
                          }));
                }),
          ],
        ),
        SettingsSection(
          title: const Text('Settings'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              title: const Text('Sign Out'),
              onPressed: (a) => auth.signOut(),
              leading: const Icon(Icons.logout),
            ),
            SettingsTile.navigation(
              title: const Text('About'),
              leading: const Icon(Icons.info),
            ),
          ],
        ),
      ],
    );
  }
}
