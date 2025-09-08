import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model class (state holder)
class CartProvider extends ChangeNotifier {
  int _itemCount = 0;

  int get itemCount => _itemCount;

  void addToCart() {
    _itemCount++;
    notifyListeners();
  }

  void removeFromCart() {
    if (_itemCount > 0) {
      _itemCount--;
      notifyListeners();
    }
  }
}

class MainAppProvider extends StatelessWidget {
  const MainAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Provider Example')),
        body: Center(
          child: Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<CartProvider>(
                    builder: (BuildContext context, CartProvider, child) {
                      return Text(
                        "Cart Item: ${CartProvider.itemCount}",
                        style: TextStyle(fontSize: 24, color: Colors.blue),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CartProvider>().addToCart();
                        },
                        icon: Icon(Icons.add),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          context.read<CartProvider>().removeFromCart();
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
//Practice Task 7.6 Provider Intro Ans Submitted
class ShoppingSystem extends ChangeNotifier{
  int _cartCount = 0;
  int get cartCount => _cartCount;

  int _WishlistCount = 0;
  int get WishlistCount => _WishlistCount;

  void addToCart(){
    _cartCount++;
    notifyListeners();
  }
  void addToWishlist(){
    _WishlistCount++;
    notifyListeners();

  }
  void resetAll(){
    _cartCount = 0;
    _WishlistCount = 0;
    notifyListeners();
  }
}

void main(){
  runApp(
      ChangeNotifierProvider(
        create:(_)=> ShoppingSystem(),
        child: ShoppingCountSystemProvider(),

      )
  );
}
class ShoppingCountSystemProvider extends StatelessWidget {
  const ShoppingCountSystemProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final  cratControl = context.watch<ShoppingSystem>();
    final  cratCounterControl = context.read<ShoppingSystem>();
    return Consumer<ShoppingSystem>(
      builder: (BuildContext context, ShoppingSystem , child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('Shopping System'),
              actions: [
                Text("Cart: ${cratControl.cartCount}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Text("Wishlist: ${cratControl.WishlistCount}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),

              ],
            ),
            body: Center(
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Product Controller",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            cratCounterControl.addToCart();

                          }, child: Text("Add to Cart")),
                          SizedBox(width: 10,),
                          ElevatedButton(onPressed: (){cratCounterControl.addToWishlist();}, child: Text("Add to Cart")),
                        ],


                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){cratCounterControl.resetAll();}, child: Text("Add to Cart")),
                    ],
                  ),
                ),
              ),
            )
        ),
      );
    },

    );
  }
}

