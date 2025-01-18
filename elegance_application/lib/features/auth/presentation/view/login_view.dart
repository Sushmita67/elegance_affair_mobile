// import 'package:elegance_application/features/auth/presentation/view/register_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/common/snackbar/snackbar.dart';
// import '../../../home/presentation/view/home_view.dart';
// import '../view_model/login/login_bloc.dart';

// class LoginView extends StatelessWidget {
//   LoginView({super.key});

//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController(text: 'sushmita');
//   final _passwordController = TextEditingController(text: 'sushmita123');

//   final _gap = const SizedBox(height: 8);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontFamily: 'Brand Bold',
//                       ),
//                     ),
//                     _gap,
//                     TextFormField(
//                       key: const ValueKey('username'),
//                       controller: _usernameController,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Username',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter username';
//                         }
//                         return null;
//                       },
//                     ),
//                     _gap,
//                     TextFormField(
//                       key: const ValueKey('password'),
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                       ),
//                       validator: ((value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter password';
//                         }
//                         return null;
//                       }),
//                     ),
//                     _gap,
//                     ElevatedButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           context.read<LoginBloc>().add(
//                             LoginStudentEvent(
//                               context: context,
//                               username: _usernameController.text,
//                               password: _passwordController.text,
//                             ),
//                           );

//                             if (_usernameController.text == 'kiran' &&
//                                 _passwordController.text == 'kiran123') {
//                               context.read<LoginBloc>().add(
//                                     NavigateHomeScreenEvent(
//                                       destination: HomeView(),
//                                       context: context,
//                                     ),
//                                   );
//                             } else {
//                               showMySnackBar(
//                                 context: context,
//                                 message: 'Invalid username or password',
//                                 color: Colors.red,
//                               );
//                             }
//                         }
//                       },
//                       child: const SizedBox(
//                         height: 50,
//                         child: Center(
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Brand Bold',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     ElevatedButton(
//                       key: const ValueKey('registerButton'),
//                       onPressed: () {
//                         context.read<LoginBloc>().add(
//                           NavigateRegisterScreenEvent(
//                             destination: RegisterView(),
//                             context: context,
//                           ),
//                         );
//                       },
//                       child: const SizedBox(
//                         height: 50,
//                         child: Center(
//                           child: Text(
//                             'Register',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Brand Bold',
//                             ),
//                           ),
//                         ),
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
import 'package:google_fonts/google_fonts.dart';
import 'package:elegance_application/features/auth/presentation/view/register_view.dart';

import '../../../../core/common/snackbar/snackbar.dart';
import '../../../home/presentation/view/home_view.dart';
import '../view_model/login/login_bloc.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Center(
                      child: SvgPicture.asset(
                        'assets/icons/elegance-affair.svg',
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Heading Text
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.playfairDisplaySc(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Username Field
                    TextFormField(
                      key: const ValueKey('username'),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "E-MAIL",
                        labelStyle: GoogleFonts.montserratAlternates(
                          fontSize: 16,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    // Password Field with Toggle
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: "PASSWORD",
                        labelStyle: GoogleFonts.montserratAlternates(
                          fontSize: 16,
                        ),
                        border: const OutlineInputBorder(),
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
                    const SizedBox(height: 20),
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot_password');
                        },
                        child: Text(
                          "FORGOT PASSWORD?",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                                  LoginStudentEvent(
                                    context: context,
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );

                            if (_usernameController.text == 'Sushmita' &&
                                _passwordController.text == 'sush123') {
                              context.read<LoginBloc>().add(
                                    NavigateHomeScreenEvent(
                                      destination: HomeView(),
                                      context: context,
                                    ),
                                  );
                            } else {
                              showMySnackBar(
                                context: context,
                                message: 'Invalid username or password',
                                color: Colors.red,
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Log In",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),
                    // Create Account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          key: const ValueKey('createAccountButton'),
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  NavigateRegisterScreenEvent(
                                    destination: RegisterView(),
                                    context: context,
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.transparent, // Transparent background
                            elevation: 0, // No shadow
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none, // No border
                            ),
                          ),
                          child: Text(
                            "Create Account",
                            style: GoogleFonts.montserratAlternates(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // OR Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(thickness: 2)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 43, 42, 42),
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(thickness: 2)),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Social Media Buttons
                    Column(
                      children: [
                        _buildSocialLoginButton(
                          "Login with Facebook",
                          Colors.blue,
                          Icons.facebook,
                          Colors.white,
                        ),
                        const SizedBox(height: 25),
                        _buildSocialLoginButton(
                          "Login with Google",
                          Colors.grey.shade300,
                          Icons.g_mobiledata,
                          Colors.black87,
                        ),
                      ],
                    ),
                    const SizedBox(height: 90),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(
      String label, Color bgColor, IconData icon, Color textColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        icon: Icon(icon, color: textColor),
        label: Text(
          label,
          style: GoogleFonts.montserratAlternates(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
