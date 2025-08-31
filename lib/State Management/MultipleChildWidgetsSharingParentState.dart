//Practice Task 7.3 – Multiple Child Widgets Sharing Parent State Ans Submitted
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  int _cartCount = 0;
  void _addToCart(){
    setState(() {
      _cartCount++;
    });
  }

  void _resetCart(){
    setState(() {
      _cartCount = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping App"),
        actions: [
          Text("Count: $_cartCount",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CartSummaryWidget(countItem: _cartCount),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProductListWidget(addToCrtBtn: _addToCart),
                          ResetCartWidget(rstButton: _resetCart),
                        ],
                      )


                    ],
                  ),

                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class ProductListWidget extends StatelessWidget {
  final VoidCallback addToCrtBtn;
  const ProductListWidget({super.key, required this.addToCrtBtn});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: addToCrtBtn, child: Text("Add to Cart"));
  }
}

class ResetCartWidget extends StatelessWidget {
  final VoidCallback rstButton;
  const ResetCartWidget({super.key, required this.rstButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: rstButton, child: Text("Reset Cart"));
  }
}
 class CartSummaryWidget extends StatelessWidget {
  final int countItem;
   const CartSummaryWidget({super.key, required this.countItem,});
 
   @override
   Widget build(BuildContext context) {
     return Text("Total items in cart: $countItem",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 25));
   }
 }
 

