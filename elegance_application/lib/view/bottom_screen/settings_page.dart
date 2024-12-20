// import 'package:flutter/material.dart';

// import 'settings_items.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false, // Removed back button
//         title: const Text(
//           "Settings",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: const [
//           SettingsItem(title: "Account Information"),
//           SettingsItem(title: "Payment Setting"),
//           SettingsItem(title: "Address Book"),
//           SettingsItem(
//             title: "Messages",
//             subtitle: "Receive exclusive offers and personal updates",
//           ),
//           SettingsItemWithIcon(
//             title: "Country",
//             subtitle: "Nepal is your current country",
//             iconPath: 'assets/icons/nepal_flag.png',
//           ),
//           SettingsItem(
//             title: "भाषा - Language",
//             subtitle: "English",
//           ),
//           SettingsItem(title: "Account Security"),
//           SettingsItem(title: "Policies"),
//           SettingsItem(title: "Help"),
//           SettingsItem(title: "Feedback"),
//           SettingsItem(title: "Request Account Deletion"),
//           SizedBox(height: 10),
//           // Center(
//           //   child: Text(
//           //     "9.7.1 (371)",
//           //     style: TextStyle(color: Colors.grey),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        // backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Account Settings"),
              const Divider(height: 20, thickness: 1),
              _buildActionTile(
                title: "Reset Password",
                description: "Change your password to a new, more secure one.",
                onPressed: () {
                  // Handle Reset Password
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Reset Password action"),
                  ));
                },
              ),
              _buildActionTile(
                title: "Update Email",
                description:
                    "Change the email address associated with your account.",
                onPressed: () {
                  // Handle Update Email
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Update Email action"),
                  ));
                },
              ),
              _buildActionTile(
                title: "Update Username",
                description: "Change the username displayed on your profile.",
                onPressed: () {
                  // Handle Update Username
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Update Username action"),
                  ));
                },
              ),
              _buildActionTile(
                title: "Update Profile Picture",
                description:
                    "Update the profile picture associated with your account.",
                onPressed: () {
                  // Handle Update Profile Picture
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Update Profile Picture action"),
                  ));
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          // color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    // color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              "Update",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
