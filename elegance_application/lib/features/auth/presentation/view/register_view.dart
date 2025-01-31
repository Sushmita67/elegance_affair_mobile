import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../view_model/signup/register_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 8);
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Sushmita B');
  final _usernameController = TextEditingController(text: 'Sush');
  final _phoneController = TextEditingController(text: '9876543210');
  final _emailController = TextEditingController(text: 'sush@gmail.com');
  final _passwordController = TextEditingController(text: 'sush123');
  final _confirmPasswordController = TextEditingController(text: 'sush123');

  bool _isPasswordVisible = false;


  // Checking for Runtime Camera Permissions
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  bool _termsAccepted = false;

  Future _browseImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo != null) {
        setState(() {
          _img = File(photo.path);

          //Send File to server
          context.read<RegisterBloc>().add(LoadImage(file: _img!));
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
      body: MultiBlocListener(
        listeners: [
          // Listener for Image Upload
          BlocListener<RegisterBloc, RegisterState>(
            listenWhen: (previous, current) =>
                previous.isImageLoading != current.isImageLoading ||
                previous.isImageSuccess != current.isImageSuccess,
            listener: (context, state) {
              if (state.isImageLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Uploading image...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else if (state.isImageSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Image uploaded successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (!state.isImageLoading &&
                  !state.isImageSuccess &&
                  state.imageName == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to upload image. Please try again.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          // Listener for Student Registration
          BlocListener<RegisterBloc, RegisterState>(
            listenWhen: (previous, current) =>
                previous.isLoading != current.isLoading ||
                previous.isSuccess != current.isSuccess,
            listener: (context, state) {
              if (state.isLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registering user...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else if (state.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User registered successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );

                // Navigate back to the login page after registration success
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              } else if (!state.isLoading && !state.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to register user. Try again.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(height: 12),
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
                                    checkCameraPermission();
                                    _browseImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.camera),
                                  label: const Text('Camera'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    checkCameraPermission();
                                    _browseImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.image),
                                  label: const Text('Gallery'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 180,
                        width: 180,
                        child: Container(
                          alignment: Alignment.center,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.white,
                                backgroundImage: _img != null
                                    ? FileImage(_img!)
                                    : AssetImage(
                                        'assets/images/profile.png',
                                      ) as ImageProvider,
                              ),
                              Positioned(
                                bottom: 5,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Colors.black.withValues(alpha: 0.3),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 24,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',labelStyle:
                      GoogleFonts.montserratAlternates(fontSize: 16, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    _gap,
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',labelStyle:
                      GoogleFonts.montserratAlternates(fontSize: 16, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(Icons.account_circle),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    _gap,
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number.',labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16, fontWeight: FontWeight.bold),
                              prefixIcon: const Icon(Icons.phone),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    _gap,
                    _gap,
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',labelStyle:
                      GoogleFonts.montserratAlternates(fontSize: 16, fontWeight: FontWeight.bold),
                        prefixIcon: const Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    _gap,

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',labelStyle:
                      GoogleFonts.montserratAlternates(fontSize: 16, fontWeight: FontWeight.bold),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    _gap,

// Confirm Password Field
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',labelStyle:
                      GoogleFonts.montserratAlternates(fontSize: 16, fontWeight: FontWeight.bold),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    _gap,

// Terms and Conditions Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _termsAccepted,
                          activeColor: Colors.black,
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
                              style: const TextStyle(fontSize: 16, color: Colors.black),
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

// Sign Up Button
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_termsAccepted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please accept the Terms and Conditions'),
                              ),
                            );
                            return;
                          }

                          if (_key.currentState!.validate()) {
                            final registerState = context.read<RegisterBloc>().state;
                            final imageName = registerState.imageName;
                            context.read<RegisterBloc>().add(RegisterUser(
                              name: _nameController.text,
                              username: _usernameController.text,
                              phone: _phoneController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              photo: imageName,
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Set the border radius
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    _gap,

// Already Have an Account? Sign In
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the content
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          key: const ValueKey('loginButton'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.montserratAlternates(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
      ),
    );
  }
}
