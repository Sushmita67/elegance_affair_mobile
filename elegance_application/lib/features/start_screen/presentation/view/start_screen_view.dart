import 'package:elegance_application/features/start_screen/presentation/view_model/start_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartScreenCubit(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<StartScreenCubit, void>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Logo Container
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/elegance_affair.png',
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Tagline
                  Text(
                    "Timeless jewelry, personalized for you",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.greatVibes(
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 300),
                  // Main Heading
                  Text(
                    "Discover Timeless Elegance\nAt Our Jewelers",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplaySc(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Start Button
                  ElevatedButton(
                    onPressed: () {
                      context.read<StartScreenCubit>().navigateToLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  // Footer Text
                  Text(
                    "Sparkle effortlessly with us.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserratAlternates(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
