import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: Container(
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
                    // color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 25),
                // Email Field
                TextField(
                  decoration: InputDecoration(
                    labelText: "E-MAIL",
                    labelStyle: GoogleFonts.montserratAlternates(
                      fontSize: 16,
                      // color: Colors.black54,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),
                // Password Field
                TextField(
                  decoration: InputDecoration(
                    labelText: "PASSWORD",
                    labelStyle: GoogleFonts.montserratAlternates(
                      fontSize: 16,
                      // color: Colors.black54,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // Forgot Password Align Right
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
                        // color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bottom page');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
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
                // Create Account as Button
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
                    // Create Account Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor:
                        //     const Color.fromARGB(255, 155, 152, 152),
                        // foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Create account",
                        style: GoogleFonts.montserratAlternates(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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

                // Social Media Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialIconButton(Icons.facebook,
                        const Color.fromARGB(255, 101, 195, 238)),
                    _buildSocialIconButton(Icons.g_mobiledata,
                        const Color.fromARGB(255, 255, 128, 128)),
                    _buildSocialIconButton(Icons.apple, Colors.black),
                  ],
                ),
                const SizedBox(height: 90), // Add spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIconButton(IconData icon, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        side: BorderSide(color: color),
      ),
      child: Icon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}
