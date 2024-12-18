import 'package:flutter/material.dart';

import 'settings_items.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removed back button
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          SettingsItem(title: "Account Information"),
          SettingsItem(title: "Payment Setting"),
          SettingsItem(title: "Address Book"),
          SettingsItem(
            title: "Messages",
            subtitle: "Receive exclusive offers and personal updates",
          ),
          SettingsItemWithIcon(
            title: "Country",
            subtitle: "Nepal is your current country",
            iconPath: 'assets/icons/nepal_flag.png',
          ),
          SettingsItem(
            title: "भाषा - Language",
            subtitle: "English",
          ),
          SettingsItem(title: "Account Security"),
          SettingsItem(title: "Policies"),
          SettingsItem(title: "Help"),
          SettingsItem(title: "Feedback"),
          SettingsItem(title: "Request Account Deletion"),
          SizedBox(height: 10),
          // Center(
          //   child: Text(
          //     "9.7.1 (371)",
          //     style: TextStyle(color: Colors.grey),
          //   ),
          // ),
        ],
      ),
    );
  }
}
