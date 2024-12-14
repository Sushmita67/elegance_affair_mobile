import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color to white
        child: SingleChildScrollView( // Make the content scrollable
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50), // Add spacing for better alignment
                // Logo
                Center(
                  child: Image.asset(
                    'assets/icons/elegance_affair.png',
                    height: 80,
                  ),
                ),
                const SizedBox(height: 20),
                // Heading Text
                Text(
                  "Welcome Back!",
                  style: GoogleFonts.playfairDisplaySc(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                // Email Field
                TextField(
                  decoration: InputDecoration(
                    labelText: "E-MAIL",
                    labelStyle: GoogleFonts.montserratAlternates(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Field
                TextField(
                  decoration: InputDecoration(
                    labelText: "PASSWORD",
                    labelStyle: GoogleFonts.montserratAlternates(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the HomeScreen after login
                    Navigator.pushReplacementNamed(context, '/homepage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Add forgot password functionality
                  },
                  child: const Text("Forgot Password?"),
                ),
                const SizedBox(height: 20),
                // Sign Up Navigation
                Column(
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to SignUpPage
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text("Create Account"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Social Login Buttons (Facebook, Google)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add Facebook login functionality
                      },
                      icon: const Icon(Icons.facebook),
                      label: const Text("Login with Facebook"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add Google login functionality
                      },
                      icon: const Icon(Icons.g_mobiledata),
                      label: const Text("Login with Google"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50), // Add spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
