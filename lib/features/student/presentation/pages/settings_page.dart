import 'package:flutter/material.dart';

import '../widgets/logout_button.dart';
import '../widgets/settings_switch_tile.dart';
import '../widgets/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            SettingsSwitchTile(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),

            SettingsSwitchTile(
              icon: Icons.notifications,
              title: "Notifications",
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),

            SettingsTile(
              icon: Icons.language,
              title: "Language",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Language feature coming soon..."),
                  ),
                );
              },
            ),

            SettingsTile(
              icon: Icons.lock,
              title: "Change Password",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Change Password coming soon..."),
                  ),
                );
              },
            ),

            SettingsTile(
              icon: Icons.info,
              title: "About App",
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Modern High School",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "© 2026 Modern High School",
                );
              },
            ),

            const SizedBox(height: 30),

            const LogoutButton(),

          ],
        ),
      ),
    );
  }
}