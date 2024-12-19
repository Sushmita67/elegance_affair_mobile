// import 'package:flutter/material.dart';

// class SettingsItem extends StatelessWidget {
//   final String title;
//   final String? subtitle;

//   const SettingsItem({required this.title, this.subtitle, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ListTile(
//           title: Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//           ),
//           subtitle: subtitle != null
//               ? Text(
//                   subtitle!,
//                   style: const TextStyle(color: Colors.grey),
//                 )
//               : null,
//           onTap: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("$title clicked")),
//             );
//           },
//         ),
//         const Divider(height: 1),
//       ],
//     );
//   }
// }

// class SettingsItemWithIcon extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String iconPath;

//   const SettingsItemWithIcon({
//     required this.title,
//     required this.subtitle,
//     required this.iconPath,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           leading: CircleAvatar(
//             backgroundImage: AssetImage(iconPath),
//             radius: 18,
//           ),
//           title: Text(title, style: const TextStyle(fontSize: 16)),
//           subtitle: Text(
//             subtitle,
//             style: const TextStyle(color: Colors.grey),
//           ),
//           onTap: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("$title clicked")),
//             );
//           },
//         ),
//         const Divider(height: 1),
//       ],
//     );
//   }
// }
