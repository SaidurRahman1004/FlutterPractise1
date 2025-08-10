import 'package:flutter/material.dart';

class EcommerceProductCard extends StatelessWidget {
  const EcommerceProductCard({super.key});

  final String imageUrl =
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=60";
  final String productName = "Running Shoes";
  final double price = 129.99;
  final String discount = "20% OFF";

  void showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E-commerce Product Layout")),
      body: Center(
        child: Container(
          width: 250,
          height: 350,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // 📌 Background Product Image
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 📌 Discount Badge (Top-Left)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    discount,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // 📌 Wishlist Button (Top-Right)
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () => showSnack(context, "Added to Wishlist"),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              ),

              // 📌 Product Price (Bottom-Left)
              Positioned(
                bottom: 50,
                left: 10,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // 📌 Add to Cart Button (Bottom-Right)
              Positioned(
                bottom: 10,
                right: 10,
                child: ElevatedButton(
                  onPressed: () => showSnack(context, "Added to Cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text("Add to Cart"),
                ),
              ),

              // 📌 Product Name (Bottom-Center)
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  productName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                            blurRadius: 4,
                            color: Colors.black,
                            offset: Offset(1, 1))
                      ],
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
