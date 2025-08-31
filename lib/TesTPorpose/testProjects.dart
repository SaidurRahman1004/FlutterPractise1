import 'package:flutter/material.dart';

class MultiChildParentExample extends StatefulWidget {
  const MultiChildParentExample({super.key});

  @override
  State<MultiChildParentExample> createState() => _MultiChildParentExampleState();
}

class _MultiChildParentExampleState extends State<MultiChildParentExample> {
  int _cartCount = 0;

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
  }

  void _resetCart() {
    setState(() {
      _cartCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Child Widgets Sharing State"),
        actions: [
          // Child 1: Cart Count in AppBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("Cart: $_cartCount 🛒")),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Child 2: Product List
          ProductListWidget(onAdd: _addToCart),

          const SizedBox(height: 20),

          // Child 3: Reset Cart Button
          ResetCartWidget(onReset: _resetCart),

          const SizedBox(height: 20),

          // Child 4: Cart Summary Widget
          CartSummaryWidget(count: _cartCount),
        ],
      ),
    );
  }
}

/// 🛒 Product List
class ProductListWidget extends StatelessWidget {
  final VoidCallback onAdd;
  const ProductListWidget({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAdd,
      child: const Text("Add Product to Cart"),
    );
  }
}

/// 🔄 Reset Button
class ResetCartWidget extends StatelessWidget {
  final VoidCallback onReset;
  const ResetCartWidget({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onReset,
      child: const Text("Reset Cart"),
    );
  }
}

/// 📊 Cart Summary
class CartSummaryWidget extends StatelessWidget {
  final int count;
  const CartSummaryWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Total items in cart: $count",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
