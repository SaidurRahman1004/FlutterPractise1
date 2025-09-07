import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ✅ 1. Model class (state holder)
class CartModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void addItem() {
    _count++;
    notifyListeners(); // 🔔 Rebuild করবে সেই widget যেগুলো শুনছে
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}


class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>(); // ✅ listen করে data নিলো
    return Scaffold(
      appBar: AppBar(title: const Text("Provider Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cart Count: ${cart.count}",
                style: const TextStyle(fontSize: 24)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => context.read<CartModel>().addItem(),
              child: const Text("Add to Cart"),
            ),

            ElevatedButton(
              onPressed: () => context.read<CartModel>().reset(),
              child: const Text("Reset Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
