import 'dart:io';

import 'package:elegance_application/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _termsAccepted = false;
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  final _gap = const SizedBox(height: 8);
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/logo-4.svg',
              height: 90,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  _pickImage(ImageSource
                                      .camera); // Pick image from camera
                                },
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _pickImage(ImageSource
                                      .gallery); // Pick image from gallery
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140,
                          width: 150,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _selectedImage != null
                                ? FileImage(_selectedImage!)
                                : const AssetImage(
                                    'assets/images/jewellryyyy.jpg',
                                  ) as ImageProvider,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Upload Picture',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Full Name',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                        prefixIcon: const Icon(Icons.person)),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Username',
                      labelStyle:
                          GoogleFonts.montserratAlternates(fontSize: 16),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter usernamename';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Phone Number',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                        prefixIcon: const Icon(Icons.phone)),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Email',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                        prefixIcon: const Icon(Icons.email)),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Password',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                        prefixIcon: Icon(Icons.lock)),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle:
                          GoogleFonts.montserratAlternates(fontSize: 16),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  Row(
                    children: [
                      Checkbox(
                        value: _termsAccepted,
                        activeColor: Color(0xFFFE5404),
                        onChanged: (bool? value) {
                          setState(() {
                            _termsAccepted = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'I accept all the ',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Terms and Conditions.',
                                style: GoogleFonts.montserratAlternates(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_termsAccepted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please accept the Terms and Conditions'),
                            ),
                          );
                          return;
                        }
                        if (_key.currentState!.validate()) {
                          context.read<RegisterBloc>().add(
                                RegisterCustomer(
                                  name: _nameController.text,
                                  username: _usernameController.text,
                                  phone: _phoneController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Set the border radius
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  _gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.montserratAlternates(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
