import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'WishlistProvider.dart';

class WishlistProvider extends ChangeNotifier {
  List<String> _wishlists = [];

  UnmodifiableListView<String> get wishlists =>
      UnmodifiableListView(_wishlists);

  //wishlists added functions
  void addItem(String itemName) {
    _wishlists.add(itemName);
    notifyListeners();
  }

  //wishlists delet functions
  void removeItem(String itemName) {
    _wishlists.remove(itemName);
    notifyListeners();
  }
}

class wishlistHandle extends StatelessWidget {
  const wishlistHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductShowUI(),
    );
  }
}

class ProductShowUI extends StatelessWidget {
  ProductShowUI({super.key});

  final List<Map<String, dynamic>> products = const [
    {'icon': Icons.phone_android, 'name': 'Smartphone', 'price': 12000},
    {'icon': Icons.laptop, 'name': 'Laptop', 'price': 55000},
    {'icon': Icons.watch, 'name': 'Smart Watch', 'price': 3500},
    {'icon': Icons.headphones, 'name': 'Headphones', 'price': 2200},
    {'icon': Icons.tv, 'name': 'LED TV', 'price': 40000},
  ];

  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("WishList"),
        actions: [
          Consumer<WishlistProvider>(
            builder: (context, wishlistProvider, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0), // টেক্সট এবং বাটনের মধ্যে একটু ফাঁকা
                child: Center( // টেক্সটটিকে উল্লম্বভাবে মাঝখানে আনতে
                  child: Text(
                    '❤ ${wishlistProvider.wishlists.length}', // .wishlists ব্যবহার করা ভালো
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              CustomSimpleDialog(context);
            },
            child: Text("See Wishlist"),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(product['icon'], size: 40, color: Colors.blue),
                SizedBox(height: 10),
                Text(
                  product['name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '৳${product['price']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    mysnk('Selected ${product['name']}', context);
                    context.read<WishlistProvider>().addItem(product['name']);
                  },
                  child: Text("Add to Wishlist"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void CustomSimpleDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        //SimpleDialog → container।
        title: Text("Wishlisted Item"),
        children: [
          Container(
            height: 400,
            width: 350,
            child: Consumer<WishlistProvider>(
              builder:
                  (context, wishlistproviderUi, child,) {
                return ListView.builder(
                  itemCount: wishlistproviderUi.wishlists.length,
                    itemBuilder: (context, index){
                      final wishlist = wishlistproviderUi.wishlists[index];
                      return ListTile(
                        title: Text(wishlist),
                        trailing: IconButton(onPressed: (){
                          context.read<WishlistProvider>().removeItem(wishlist);
                        }, icon: Icon(Icons.remove_circle,color: Colors.red,)),
                      );
                    }
                );
                  },
            ),
          ),
        ],
      ),
    );
  }
}
