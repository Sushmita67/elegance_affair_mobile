import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/elegance_affair.png',
                height: 60,
                width: 190,
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search anything")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Welcome to Wishlists")),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 400.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Neckset.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 10,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Elegance Affair's jewelry collection features a stunning array of American diamond and gold-plated designs, perfect for adding a touch of glamour to any outfit. Each piece combines elegance with modern sophistication, offering a variety of styles to complement your personal taste.",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          buildSectionTitle("New Arrivals"),
          buildHorizontalListView(context, itemCount: 6),
          const SizedBox(height: 20),
          buildSectionTitle("Explore More Collections"),
          buildHorizontalCollections(context),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildHorizontalListView(BuildContext context,
      {required int itemCount}) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, '/new_arrival_${index + 1}'),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/jewels.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Item ${index + 1}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "₹${(1000 + index * 50)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildHorizontalCollections(BuildContext context) {
    final collections = [
      {"title": "New Year", "route": '/collection_new_year'},
      {"title": "Luxury", "route": '/collection_luxury'},
      {"title": "Wedding", "route": '/collection_wedding'},
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: collections.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, collections[index]['route']!),
            child: buildCollectionItem(
              context,
              collections[index]['title']!,
              'assets/images/jewels.jpg',
            ),
          );
        },
      ),
    );
  }

  Widget buildCollectionItem(
      BuildContext context, String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
