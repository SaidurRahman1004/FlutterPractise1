//Practice Task 6.45: Hero Animation — Page Transition Animation Ans Submitted
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Advanced%20Custom%20Card%20Design/protuctDetails.dart';

class HiruDonAnimation extends StatelessWidget {
  HiruDonAnimation({super.key});

  final List<Map<String, String>> songs = [
    {
      "id": "1",
      "title": "Bohemian Rhapsody",
      "artist": "Queen",
      "albumCoverUrl":
          "data:image/jpeg;base64,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",
    },
    {
      "id": "2",
      "title": "Imagine",
      "artist": "John Lennon",
      "albumCoverUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWja5rLQLLLvVPa7Q3R_ezB2rQ24qU6vwtQw&s",
    },
    {
      "id": "3",
      "title": "Stairway to Heaven",
      "artist": "Led Zeppelin",
      "albumCoverUrl":
          "https://i1.sndcdn.com/artworks-000354563859-xptl1i-t500x500.jpg",
    },
    {
      "id": "4",
      "title": "Like a Rolling Stone",
      "artist": "Bob Dylan",
      "albumCoverUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmmCnwp5hvA92R4LEDkWFeFllA_spHE-qdlQ&s",
    },
    {
      "id": "5",
      "title": "Hey Jude",
      "artist": "The Beatles",
      "albumCoverUrl":
          "data:image/jpeg;base64,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",
    },
  ];

  mysnk(msg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hiro Player")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            final tag = "song_$index";
            return GestureDetector(
              onTap: () {
                mysnk("This is ${song["title"]}", context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongDetailsPage(song: song, tag: tag),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: Hero(
                    tag: tag,
                    child: ClipRRect(
                      child: Image.network(song["albumCoverUrl"]!),
                    ),
                  ),
                  title: Text(song["title"]!),
                  subtitle: Text(song["artist"]!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//second page
class SongDetailsPage extends StatelessWidget {
  final Map<String, String> song;
  final String tag;

  const SongDetailsPage({super.key, required this.song, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Song Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: tag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: SizedBox(
                  height: 300,
                  width: 400,
                  child: Image.network(
                    song["albumCoverUrl"]!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              song["title"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.skip_previous, size: 40),
                SizedBox(width: 20),
                Icon(Icons.play_circle_fill, size: 60, color: Colors.blue),
                SizedBox(width: 20),
                Icon(Icons.skip_next, size: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Practice Task 6.45: Hero Animation — Page Transition Animation Ans Submitted
class hroAnimation extends StatelessWidget {
  hroAnimation({super.key});

  final List<Map<String, String>> products = [
    {
      "id": "1",
      "name": "Mountain Bike",
      "description": "Durable and perfect for off-road trails.",
      "price": "499.99",
      "image":
          "https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?auto=format&fit=crop&w=800&q=60",
    },
    {
      "id": "2",
      "name": "Smart Watch",
      "description": "Monitor your health and stay connected.",
      "price": "199.99",
      "image":
          "https://luxurywatchbd.com/wp-content/uploads/2021/12/lmaiwescgjgvsdga.jpg",
    },
    {
      "id": "3",
      "name": "Backpack",
      "description": "A spacious bag ideal for travel and school.",
      "price": "69.99",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCp_Jurg24L6sUGwZciGHmC812nuX02djHJQ&s",
    },
    {
      "id": "4",
      "name": "Camera",
      "description": "Capture high-quality images anywhere.",
      "price": "899.99",
      "image":
          "https://images.unsplash.com/photo-1510127034890-ba27508e9f1c?auto=format&fit=crop&w=800&q=60",
    },
    {
      "id": "5",
      "name": "Running Shoes",
      "description": "Comfortable for jogging and workouts.",
      "price": "129.99",
      "image":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=60",
    },
    {
      "id": "6",
      "name": "Laptop",
      "description": "High-performance laptop for all tasks.",
      "price": "1099.99",
      "image":
          "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=800&q=60",
    },
    {
      "id": "7",
      "name": "Headphones",
      "description": "Noise-cancelling over-ear headphones.",
      "price": "149.99",
      "image":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=60",
    },
    {
      "id": "8",
      "name": "Coffee Mug",
      "description": "Minimalist design ceramic coffee mug.",
      "price": "15.99",
      "image":
          "https://www.webstaurantstore.com/images/products/large/60022/2523216.jpg",
    },
    {
      "id": "9",
      "name": "Smartphone",
      "description": "Latest model with advanced features.",
      "price": "999.99",
      "image":
          "https://images.unsplash.com/photo-1580910051074-3eb694886505?auto=format&fit=crop&w=800&q=60",
    },
    {
      "id": "10",
      "name": "Wrist Watch",
      "description": "Luxury leather wrist watch.",
      "price": "349.99",
      "image":
          "https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=800&q=60",
    },
  ];

  mysnk(msg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hiro Animation")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final tag = "product_$index";
            return GestureDetector(
              onTap: (){
                mysnk("This is ${product["name"]}", context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => productDetails(product: product, tag: tag),));
              },
              child: Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // গোলাকার কোণা
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: tag,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.network(
                            product["image"]!,
                            height: 100,

                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          product["name"]!,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                      const SizedBox(height: 12),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "\$${product["price"]}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class productDetails extends StatelessWidget {
  final Map<String, String> product;
  final String tag;
  const productDetails({super.key,required this.product,required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Padding(
          padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: tag, 
                  child: Image.network(product["image"]!,height: 300,width: double.infinity,fit: BoxFit.cover, ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  product["name"]!,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 25),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "\$${product["price"]}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.redAccent),
                ),
              ),

              const SizedBox(height: 25),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  product["description"]!,
                  style: const TextStyle(fontSize: 18),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
