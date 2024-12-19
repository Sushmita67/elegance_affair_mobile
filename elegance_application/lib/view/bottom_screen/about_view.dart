import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Image.asset(
            'assets/icons/elegance_affair.png',
            height: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 260.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/jewels.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Elevate your senses with our\n exquisite collection of luxury jewellery,\n crafted with the finest attention to detail.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            // About Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Elegance Affair 💎💍',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Emirates Elegance is a luxury jewelry store, offering an exclusive collection of exquisite pieces for discerning individuals. Our journey began with a deep passion for fine craftsmanship and a commitment to curating jewelry that evokes emotion, inspires confidence, and captures timeless elegance. ✨ ',
                    style: TextStyle(
                      fontSize: 16.0,
                      // color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'At the heart of Emirates Elegance is a dedication to quality, artistry, and customer satisfaction. We source the finest materials from around the world, and our expert artisans meticulously craft each piece to ensure a harmonious and captivating design.💖',
                    style: TextStyle(
                      fontSize: 16.0,
                      // color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Our mission is to elevate the art of jewelry, providing our customers with a truly luxurious and transformative experience. From the moment you discover an Emirates Elegance piece to the moment you wear it, we strive to create a connection that transcends the senses and leaves a lasting impression.🛍️',
                    style: TextStyle(
                      fontSize: 16.0,
                      // color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Image Section
            Center(
              child: Container(
                width: 300.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/jewellryyyy.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Follow Us On Social Media',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                // color: Colors.grey[700],
              ),
            ),
            // Social Media Icons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Instagram Icon with Gradient
                  ShaderMask(
                    shaderCallback: (Rect bounds) => const LinearGradient(
                      colors: [
                        Color(0xFFFEDA77),
                        Color(0xFFFA7E1E),
                        Color(0xFFD62976),
                        Color(0xFF962FBF),
                        Color(0xFF4F5BD5),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ).createShader(bounds),
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.instagram),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        // Replace with your Instagram link action
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // GitHub Icon
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.github),
                    color: Colors.black,
                    iconSize: 30.0,
                    onPressed: () {
                      // Replace with your GitHub link action
                    },
                  ),
                  const SizedBox(width: 16.0),
                  // Facebook Icon
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.facebook),
                    color: Colors.blue,
                    iconSize: 30.0,
                    onPressed: () {
                      // Replace with your Facebook link action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
