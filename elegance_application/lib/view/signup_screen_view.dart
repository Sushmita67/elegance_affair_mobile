import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/icons/elegance_affair.png', height: 100),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "NAME",
                labelStyle: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
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
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login page after signup
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 20),
            const Text("Already have an account?"),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }
}




