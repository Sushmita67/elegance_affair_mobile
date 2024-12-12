import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Elegance Affair",
          style: GoogleFonts.playfairDisplaySc(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the image and text like in the provided image
            Image.asset(
              'assets/images/bg.jpg', // Replace with your image path
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Description Text as in your image
            Text(
              "Elegance Affair’s jewelry collection features a stunning array of American diamond and gold-plated designs, perfect for adding a touch of glamour to any outfit. Each piece combines elegance with modern sophistication, offering a variety of styles to complement your personal taste.",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            // You can add additional sections or features if required
            // Example: Buttons or additional information
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add functionality if needed
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                  child: const Text("Explore More"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
