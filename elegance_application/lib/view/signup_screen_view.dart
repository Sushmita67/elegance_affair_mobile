import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0), // Horizontal padding
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              // Logo
              Image.asset(
                'assets/icons/elegance_affair.png',
                height: 150,
              ),
              const SizedBox(height: 30),

              // Heading Text
              Text(
                "Sign Up Here!",
                style: GoogleFonts.playfairDisplaySc(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  // color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Name Field
              TextField(
                decoration: InputDecoration(
                  labelText: "NAME",
                  labelStyle: GoogleFonts.montserratAlternates(
                    fontSize: 16,
                    // color: Colors.black54,
                  ),
                  border: const OutlineInputBorder(),
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
              const SizedBox(height: 35),

              // Signup Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.black,
                    // foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Log In Button Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account?",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: const Color.fromARGB(255, 155, 152, 152),
                      // foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: GoogleFonts.montserratAlternates(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50), // Extra space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
