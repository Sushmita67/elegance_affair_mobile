// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../view_model/signup/register_bloc.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _gap = const SizedBox(height: 8);
//   final _key = GlobalKey<FormState>();
//   final _fnameController = TextEditingController(text: 'kiran');
//   final _lnameController = TextEditingController(text: 'rana');
//   final _phoneController = TextEditingController(text: '123456789');
//   final _usernameController = TextEditingController(text: 'kiran');
//   final _passwordController = TextEditingController(text: 'kiran123');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register Student'),
//         centerTitle: true,
//       ),
//       body: BlocListener<RegisterBloc, RegisterState>(
//         listener: (context, state) {
//           if (state.isLoading) {
//             // Show a loading Snackbar
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Registering student...'),
//                 duration: Duration(seconds: 2),
//               ),
//             );
//           } else if (state.isSuccess) {
//             // Show success message and clear form
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Student registered successfully!'),
//                 backgroundColor: Colors.green,
//               ),
//             );
//             _key.currentState!.reset();

//             // Navigate back to the login page
//             Future.delayed(const Duration(seconds: 4), () {
//               Navigator.pop(
//                   context); // This pops the current register screen and goes back
//             });
//           } else if (!state.isLoading && !state.isSuccess) {
//             // Show error message
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Failed to register student. Try again.'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Form(
//                 key: _key,
//                 child: Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                           backgroundColor: Colors.grey[300],
//                           context: context,
//                           isScrollControlled: true,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(20),
//                             ),
//                           ),
//                           builder: (context) => Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton.icon(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   icon: const Icon(Icons.camera),
//                                   label: const Text('Camera'),
//                                 ),
//                                 ElevatedButton.icon(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.image),
//                                   label: const Text('Gallery'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       child: SizedBox(
//                         height: 200,
//                         width: 200,
//                         child: CircleAvatar(
//                           radius: 50,
//                           backgroundImage:
//                               const AssetImage('assets/images/profile.png')
//                                   as ImageProvider,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     TextFormField(
//                       controller: _fnameController,
//                       decoration: const InputDecoration(
//                         labelText: 'First Name',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter first name';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _lnameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Last Name',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter last name';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _phoneController,
//                       decoration: const InputDecoration(
//                         labelText: 'Phone No',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _usernameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Username',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter username';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter password';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_key.currentState!.validate()) {
//                             context.read<RegisterBloc>().add(RegisterStudent(
//                                   fName: _fnameController.text,
//                                   lName: _lnameController.text,
//                                   phone: _phoneController.text,
//                                   username: _usernameController.text,
//                                   password: _passwordController.text,
//                                 ));
//                           }
//                         },
//                         child: const Text('Register'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts
import '../view_model/signup/register_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 10);
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: '');
  final _lnameController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  bool _obscurePassword = true;

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
              height: 80,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.isLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registering Customer...'),
                duration: Duration(seconds: 2),
              ),
            );
          } else if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Customer registered successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            _key.currentState!.reset();
            Future.delayed(const Duration(seconds: 4), () {
              Navigator.pop(context);
            });
          } else if (!state.isLoading && !state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to register student. Try again.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SafeArea(
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
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.camera),
                                  label: const Text('Camera'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.image),
                                  label: const Text('Gallery'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              const AssetImage('assets/images/profile.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _fnameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: _lnameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone No',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            GoogleFonts.montserratAlternates(fontSize: 16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
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
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            context.read<RegisterBloc>().add(RegisterStudent(
                                  fName: _fnameController.text,
                                  lName: _lnameController.text,
                                  phone: _phoneController.text,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ));
                          }
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.montserratAlternates(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Login',
                              style: TextStyle(fontSize: 20)),
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
