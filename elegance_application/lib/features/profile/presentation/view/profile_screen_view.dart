// import 'dart:io';
//
// import 'package:elegance/app/shared_prefs/token_shared_prefs.dart';
// import 'package:elegance/core/common/break_common.dart';
// import 'package:elegance/features/auth/presentation/view/login_screen_view.dart';
// import 'package:elegance/features/profile/presentation/view_model/profile_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ProfileScreenView extends StatefulWidget {
//   const ProfileScreenView({super.key});
//
//   @override
//   State<ProfileScreenView> createState() => _ProfileScreenViewState();
// }
//
// class _ProfileScreenViewState extends State<ProfileScreenView> {
//   File? _image;
//
//   Future<void> checkCameraPermission() async {
//     if (await Permission.camera.request().isRestricted ||
//         await Permission.camera.request().isDenied) {
//       await Permission.camera.request();
//     }
//   }
//
//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final pickedFile = await ImagePicker().pickImage(source: source);
//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   Future<void> _logout(BuildContext context) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final tokenPrefs = TokenSharedPrefs(sharedPreferences);
//
//     await tokenPrefs.saveToken(''); // Clearing the token
//
//     if (context.mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreenView()),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final profileCubit = context.read<ProfileCubit>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'My Profile',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFFFF8E7),
//         foregroundColor: Colors.black,
//         elevation: 0.5,
//         actions: [
//           IconButton(
//             onPressed: () => _logout(context),
//             icon: const Icon(Icons.logout, color: Colors.black),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             _buildProfileImage(),
//             Break(10),
//             const Text(
//               "Hello",
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const Text(
//               "Sushmita",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Break(20),
//
//             // My Order Section
//             _buildProfileOption(Icons.shopping_bag_outlined, "My Order", () {
//               profileCubit.navigateToOrder(context);
//             }),
//
//             // Management Section
//             _buildSectionTitle("MANAGEMENT"),
//             _buildProfileOption(Icons.person_outline, "My Information", () {
//               profileCubit.navigateToMyInformation(context);
//             }),
//
//             // Support Section
//             _buildSectionTitle("SUPPORT"),
//             _buildProfileOption(Icons.help_outline, "Help", () {
//               profileCubit.navigateToHelp(context);
//             }),
//             _buildProfileOption(Icons.chat_bubble_outline, "Support", () {
//               profileCubit.navigateToSupport(context);
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileImage() {
//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         CircleAvatar(
//           radius: 50,
//           backgroundColor: Colors.grey.shade300,
//           backgroundImage: _image != null ? FileImage(_image!) : null,
//           child: _image == null
//               ? const Icon(Icons.person, size: 50, color: Colors.white)
//               : null,
//         ),
//         GestureDetector(
//           onTap: () {
//             _showImagePickerOptions();
//           },
//           child: Container(
//             padding: const EdgeInsets.all(6),
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue,
//             ),
//             child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _showImagePickerOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   checkCameraPermission();
//                   _pickImage(ImageSource.camera);
//                 },
//                 icon: const Icon(Icons.camera, size: 20),
//                 label: const Text('Camera', style: TextStyle(fontSize: 14)),
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   minimumSize: const Size(100, 40),
//                 ),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   _pickImage(ImageSource.gallery);
//                 },
//                 icon: const Icon(Icons.image, size: 20),
//                 label: const Text('Gallery', style: TextStyle(fontSize: 14)),
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   minimumSize: const Size(100, 40),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 5),
//       child: Text(
//         title,
//         style: const TextStyle(
//             fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
//       ),
//     );
//   }
//
//   Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
//     return Column(
//       children: [
//         ListTile(
//           leading: Icon(icon, color: Colors.black),
//           title: Text(
//             title,
//             style: const TextStyle(fontSize: 16),
//           ),
//           trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//           onTap: onTap,
//         ),
//         const Divider(indent: 20, endIndent: 20),
//       ],
//     );
//   }
// }
import 'dart:io';
import 'package:elegance/app/shared_prefs/token_shared_prefs.dart';
import 'package:elegance/core/common/break_common.dart';
import 'package:elegance/features/auth/presentation/view/login_screen_view.dart';
import 'package:elegance/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  File? _image;

  Future<void> checkCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isDenied || status.isRestricted) {
      await Permission.camera.request();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _logout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final tokenPrefs = TokenSharedPrefs(sharedPreferences);
    await tokenPrefs.saveToken('');

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreenView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFF8E7),
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(),
            const SizedBox(height: 12),
            const Text(
              "Hi Sushmita !",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            _buildProfileOption(Icons.shopping_bag_outlined, "My Orders", () {
              profileCubit.navigateToOrder(context);
            }),

            _buildSectionTitle("MANAGEMENT"),
            _buildProfileOption(Icons.person_outline, "My Information", () {
              profileCubit.navigateToMyInformation(context);
            }),

            _buildSectionTitle("SUPPORT"),
            _buildProfileOption(Icons.help_outline, "Help", () {
              profileCubit.navigateToHelp(context);
            }),
            _buildProfileOption(Icons.chat_bubble_outline, "Support", () {
              profileCubit.navigateToSupport(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null
                ? const Icon(Icons.person, size: 50, color: Colors.white)
                : null,
          ),
        ),
        GestureDetector(
          onTap: _showImagePickerOptions,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC9A060), // Changed color here
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImagePickerButton(
                icon: Icons.camera,
                label: 'Camera',
                onTap: () {
                  checkCameraPermission();
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              _buildImagePickerButton(
                icon: Icons.image,
                label: 'Gallery',
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImagePickerButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFC9A060), // Changed color here
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Icon(icon, color: Color(0xFFC9A060)), // Changed color here
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Colors.grey.shade100,
          onTap: onTap,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
