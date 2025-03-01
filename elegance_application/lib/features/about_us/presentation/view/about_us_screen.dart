import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Who We Are"),
            _buildSectionDescription(
                "Elegance Affair is a premier jewelry store dedicated to bringing you the finest "
                    "collection of timeless and exquisite jewelry pieces. We specialize in crafting and curating jewelry that "
                    "celebrates elegance, individuality, and sophistication."),

            _buildSectionTitle("Our Mission"),
            _buildSectionDescription(
                "Our mission is to help you express your unique style and celebrate life's most precious moments with "
                    "beautiful, high-quality jewelry. We are committed to providing exceptional craftsmanship, personalized service, "
                    "and a seamless shopping experience."),

            _buildSectionTitle("Why Choose Us?"),
            _buildBulletPoint("💎 Exquisite collections of fine jewelry, from classic to contemporary designs."),
            _buildBulletPoint("✨ Handcrafted pieces made with precision and attention to detail."),
            _buildBulletPoint("🔐 Secure and hassle-free online shopping experience."),
            _buildBulletPoint("📦 Fast and reliable delivery across multiple locations."),
            _buildBulletPoint("💎 Lifetime warranty on all our jewelry pieces."),

            _buildSectionTitle("Our Commitment"),
            _buildSectionDescription(
                "At Elegance Affair, we are committed to sustainability and ethical practices. We source our materials responsibly "
                    "and ensure that every piece of jewelry is crafted with care and integrity."),

            _buildSectionTitle("Contact Us"),
            _buildSectionDescription(
                "Have questions? Need assistance? We're here to help! Reach out to us anytime, and our team will be delighted "
                    "to assist you with your jewelry needs."),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        description,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 20, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}