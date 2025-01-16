// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class StartScreen extends StatelessWidget {
//   const StartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         // Background image for the entire screen
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/bg.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Logo Container outside the background image
//             Container(
//               width: double.infinity,
//               color: const Color.fromARGB(255, 255, 255, 255),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: Center(
//                   child: Image.asset(
//                     'assets/icons/elegance_affair.png',
//                     height: 90,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30), // Space between logo and text
//             // Main Text: Tagline
//             Text(
//               "Timeless jewelry, personalized for you",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.greatVibes(
//                 fontSize: 26,
//                 fontStyle: FontStyle.italic,
//                 fontWeight: FontWeight.bold,
//                 // color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 300),
//             // Main Heading
//             Text(
//               "Discover Timeless Elegance\nAt Our Jewelers",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.playfairDisplaySc(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 // color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 50),
//             // Start Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/login');
//               },
//               style: ElevatedButton.styleFrom(
//                 // backgroundColor: const Color.fromARGB(255, 240, 223, 223),
//                 // foregroundColor: const Color.fromARGB(255, 58, 40, 40),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: const Text(
//                 "Get Started",
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             const Spacer(),
//             // Footer Text
//             Text(
//               "Sparkle effortlessly with us.",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.montserratAlternates(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 // color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 120),
//           ],
//         ),
//       ),
//     );
//   }
// }
