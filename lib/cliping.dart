import 'package:flutter/material.dart';



class ClipCustomAiCopyid extends StatelessWidget {
  const ClipCustomAiCopyid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipExample(),
    );
  }
}

class ClipExample extends StatelessWidget {
  const ClipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ClipPath & ClipRRect Example")),
      body: Column(
        children: [
          // ---- Wave Banner (ClipPath) ----
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 180,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                "Welcome to My Shop",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ---- Profile Picture (ClipRRect) ----
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.network(
              'https://picsum.photos/200',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Wave Clipper
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);

    // Control point দিয়ে Wave বানানো
    path.quadraticBezierTo(
      size.width / 4, size.height,
      size.width / 2, size.height - 40,
    );
    path.quadraticBezierTo(
      3 * size.width / 4, size.height - 80,
      size.width, size.height - 40,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
//////////////////////////////Ai Copyed/////////////

//Practice Task 6.43 Ans Submit
class Clipp2 extends StatelessWidget {
  const Clipp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final String productName = 'Stylish Smart Watch';
  final String productPrice = '\$129.99';
  final String imageUrl =
      'https://images.pexels.com/photos/2783873/pexels-photo-2783873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Wave Banner & Rounded Card'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          // ১. Custom Wave Banner (ClipPath দিয়ে)
          ClipPath(
            clipper: WaveClipper2(),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.purple,
              child: const Center(
                child: Text(
                  'New Collection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          // ২. Rounded Product Card (ClipRRect দিয়ে)
          GestureDetector(
            // ৩. Card-এ ট্যাপ করলে SnackBar দেখানো
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to cart: $productName'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: 250,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      imageUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                      child: Text(
                        productPrice,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Wave আকৃতি তৈরির জন্য কাস্টম ক্লিপার
class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // বাম দিক থেকে নিচে শুরু

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0); // উপরের ডান কোণায় শেষ
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}