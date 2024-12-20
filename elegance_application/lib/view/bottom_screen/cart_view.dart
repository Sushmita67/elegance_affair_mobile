import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Image.asset(
              'assets/icons/elegance_affair.png',
              height: 50,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  "Your Cart 🛒",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CartItem(
                imageUrl: 'assets/images/ringsss.jpg',
                itemName: 'Gold Ring',
                size: 'Size: 7',
                price: 2500,
              ),
              CartItem(
                imageUrl: 'assets/images/Neckset.jpg',
                itemName: 'Silver Necklace',
                size: 'Size: Medium',
                price: 1500,
              ),
              CartItem(
                imageUrl: 'assets/images/earring.jpg',
                itemName: 'Diamond Earrings',
                size: 'Size: Standard',
                price: 5000,
              ),
              CartItem(
                imageUrl: 'assets/images/ringsss.jpg',
                itemName: 'Gold Ring',
                size: 'Size: 8',
                price: 2700,
              ),
              CartItem(
                imageUrl: 'assets/images/Neckset.jpg',
                itemName: 'Emerald Necklace',
                size: 'Size: Large',
                price: 3200,
              ),
              CartItem(
                imageUrl: 'assets/images/earring.jpg',
                itemName: 'Platinum Earrings',
                size: 'Size: Standard',
                price: 4500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Cart Item Widget
class CartItem extends StatefulWidget {
  final String imageUrl;
  final String itemName;
  final String size;
  final int price;

  const CartItem({
    super.key,
    required this.imageUrl,
    required this.itemName,
    required this.size,
    required this.price,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  // Methods to increment and decrement quantity
  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.itemName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.size,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // Price
                  Text(
                    "Rs. ${widget.price}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 25),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: decrement,
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: increment,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Added to cart")),
              );
            },
          ),
        ],
      ),
    );
  }
}
