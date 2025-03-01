// import 'package:elegance/app/di/di.dart';
// import 'package:elegance/core/common/break_common.dart';
// import 'package:elegance/core/common/logo_common.dart';
// import 'package:elegance/core/common/textfield_commoner.dart';
// import 'package:elegance/features/auth/presentation/view/register_screen_view.dart';
// import 'package:elegance/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:elegance/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:elegance/features/change_password/presentation/view/verify_email_view.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
//
// class LoginScreenView extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController(text:"customer");
//   final TextEditingController _passwordController = TextEditingController(text:"test12345");
//
//   LoginScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<LoginBloc>(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: Center(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                     child: Column(
//                       children: [
//                         Center(
//                           child: SvgPicture.asset(
//                             'assets/icons/logo-2.svg',
//                             height: 170,
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           "Welcome Back !",
//                           style: TextStyle(
//                             fontSize: 35,
//                             fontFamily: 'Poppins bold',
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Break(50),
//                         Textfield(
//                           controller: _emailController,
//                           obscureText: false,
//                           text: "Email",
//                           keyboardType: TextInputType.text,
//                         ),
//                         Break(16),
//                         Textfield(
//                           controller: _passwordController,
//                           obscureText: true,
//                           text: "Password",
//                           keyboardType: TextInputType.visiblePassword,
//                         ),
//                         Break(10),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               context.read<LoginBloc>().add(
//                                 NavigateForgotPasswordEvent(
//                                   onNavigate: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const VerifyEmailView(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                             child: const Text(
//                               'Forgot Password?',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Break(10),
//                         BlocConsumer<LoginBloc, LoginState>(
//                           listener: (context, state) {
//                             if (!state.isSuccess && !state.isLoading) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content:
//                                         Text('Invalid email or password')),
//                               );
//                             }
//                           },
//                           builder: (context, state) {
//                             return ElevatedButton(
//                               onPressed: state.isLoading
//                                   ? null
//                                   : () {
//                                       context.read<LoginBloc>().add(
//                                             LoginSubmittedEvent(
//                                               email: _emailController.text
//                                                   .trim(),
//                                               password: _passwordController.text
//                                                   .trim(),
//                                               onSuccess: (destination) {
//                                                 Navigator.pushReplacement(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           destination),
//                                                 );
//                                               },
//                                               onFailure: (errorMessage) {
//                                                 ScaffoldMessenger.of(context)
//                                                     .showSnackBar(
//                                                   SnackBar(
//                                                       content:
//                                                           Text(errorMessage)),
//                                                 );
//                                               },
//                                               context: context,
//                                             ),
//                                           );
//                                     },
//                               child: state.isLoading
//                                   ? const CircularProgressIndicator()
//                                   : const Text('Login'),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     text: 'Not a user? ',
//                     style: const TextStyle(color: Colors.black),
//                     children: [
//                       TextSpan(
//                         text: 'Register',
//                         style: const TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => BlocProvider(
//                                   create: (_) => getIt<RegisterBloc>(),
//                                   child: const RegisterScreenView(),
//                                 ),
//                               ),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//



// import 'package:elegance/app/di/di.dart';
// import 'package:elegance/features/auth/presentation/view/register_screen_view.dart';
// import 'package:elegance/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:elegance/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:elegance/features/change_password/presentation/view/verify_email_view.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginScreenView extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController(text: "customer");
//   final TextEditingController _passwordController = TextEditingController(text: "test12345");
//
//   LoginScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<LoginBloc>(),
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         body: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: SvgPicture.asset(
//                       'assets/icons/logo-2.svg',
//                       height: 170,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "Welcome Back!",
//                     style: GoogleFonts.playfairDisplaySc(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   TextFormField(
//                     key: const ValueKey('email'),
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       border: const OutlineInputBorder(),
//                       labelText: 'Email',
//                       labelStyle: GoogleFonts.montserratAlternates(
//                           fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter email';
//                       }
//                       if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                           .hasMatch(value)) {
//                         return 'Please enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 25),
//                   BlocBuilder<LoginBloc, LoginState>(
//                     builder: (context, state) {
//                       return TextFormField(
//                         key: const ValueKey('password'),
//                         controller: _passwordController,
//                         obscureText: !state.isPasswordVisible,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           labelStyle: GoogleFonts.montserratAlternates(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               state.isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               context.read<LoginBloc>().add(TogglePasswordVisibilityEvent());
//                             },
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           return null;
//                         },
//                       );
//                     },
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                       onPressed: () {
//                         context.read<LoginBloc>().add(
//                           NavigateForgotPasswordEvent(
//                             onNavigate: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const VerifyEmailView(),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'FORGOT PASSWORD?',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   BlocConsumer<LoginBloc, LoginState>(
//                     listener: (context, state) {
//                       if (!state.isSuccess && !state.isLoading) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Invalid email or password')),
//                         );
//                       }
//                     },
//                     builder: (context, state) {
//                       return ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
//                         ),
//                         onPressed: state.isLoading
//                             ? null
//                             : () {
//                           context.read<LoginBloc>().add(
//                             LoginSubmittedEvent(
//                               email: _emailController.text.trim(),
//                               password: _passwordController.text.trim(),
//                               onSuccess: (destination) {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => destination),
//                                 );
//                               },
//                               onFailure: (errorMessage) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text(errorMessage)),
//                                 );
//                               },
//                               context: context,
//                             ),
//                           );
//                         },
//                         child: state.isLoading
//                             ? const CircularProgressIndicator()
//                             : const Text(
//                           'Log In',
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   RichText(
//                     text: TextSpan(
//                       text: "Don't have an account? ",
//                       style: const TextStyle(color: Colors.black),
//                       children: [
//                         TextSpan(
//                           text: 'Create Account',
//                           style: const TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => BlocProvider(
//                                     create: (_) => getIt<RegisterBloc>(),
//                                     child: const RegisterScreenView(),
//                                   ),
//                                 ),
//                               );
//                             },
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.facebook, size: 50),
//                         onPressed: () {},
//                       ),
//                       const SizedBox(width: 20),
//                       IconButton(
//                         icon: const Icon(Icons.g_translate, size: 50),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:elegance/app/di/di.dart';
import 'package:elegance/features/auth/presentation/view/register_screen_view.dart';
import 'package:elegance/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:elegance/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:elegance/features/change_password/presentation/view/verify_email_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController(text: "");
  final TextEditingController _passwordController = TextEditingController(text: "");

  LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10), // Added space for adjustment
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/logo-2.svg',
                      height: 170,
                    ),
                  ),
                  const SizedBox(height: 30), // Reduced space between logo and text
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.playfairDisplaySc(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    key: const ValueKey('email'),
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: GoogleFonts.montserratAlternates(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return TextFormField(
                        key: const ValueKey('password'),
                        controller: _passwordController,
                        obscureText: !state.isPasswordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: GoogleFonts.montserratAlternates(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              context.read<LoginBloc>().add(TogglePasswordVisibilityEvent());
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                          NavigateForgotPasswordEvent(
                            onNavigate: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerifyEmailView(),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'FORGOT PASSWORD?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (!state.isSuccess && !state.isLoading) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid email or password')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                        ),
                        onPressed: state.isLoading
                            ? null
                            : () {
                          context.read<LoginBloc>().add(
                            LoginSubmittedEvent(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              onSuccess: (destination) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => destination),
                                );
                              },
                              onFailure: (errorMessage) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(errorMessage)),
                                );
                              },
                              context: context,
                            ),
                          );
                        },
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                          'Log In',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 18), // Increased text size
                      children: [
                        TextSpan(
                          text: 'Create Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20, // Increased text size for this part too
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (_) => getIt<RegisterBloc>(),
                                    child: const RegisterScreenView(),
                                  ),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
