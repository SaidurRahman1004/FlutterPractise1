/*
🧩 InheritedWidget কে কীভাবে ভাববে?
🔹 InheritedWidget আসলে কী?

👉 InheritedWidget হলো data container।
এটা Widget Tree-এর একটা জায়গায় বসে থাকে আর তার ভেতরে রাখা data নিচের সব child widget-এ ফ্রি শেয়ার করতে দেয়।

তুমি চাইলে এটাকে ভাবতে পারো 👉 "Global variable কিন্তু Widget Tree-এর ভেতরে"

👉 ধরো একটা গাছ (Widget Tree) 🌳

InheritedWidget হলো গাছের মূল (Root)-এর মতো → এখানে ডেটা রাখা আছে।

গাছের নিচে যত ডালপালা (Child Widget) আছে, সবাই সহজে সেই ডেটা ব্যবহার করতে পারে।

🔑 কনসেপ্ট (Key Ideas)

InheritedWidget → ডেটা ধরে রাখে।

of(context) → child widget এর ভেতর থেকে সেই ডেটা বের করার দরজা।

ডেটা পরিবর্তন হলে → যে widget-এ ডেটা ব্যবহার হচ্ছে, শুধু সেটাই rebuild হবে।

🧠 মনে রাখার শর্টকাট

👉 InheritedWidget = এক জায়গায় data রাখা + নিচের widget গুলোকে free access দেওয়া।
এটা Flutter-এর “global data sharing” এর বেসিক সিস্টেম।

 */
//Practice Task 7.5 — InheritedWidget Basics Ans Submitted
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStateScope extends InheritedWidget {
  //এর ভেতরে আমরা  মান  রেখেছি।
  final bool isDark;
  final int cartCount;
  final VoidCallback toggleTheme;
  final VoidCallback addToCart;
  final VoidCallback resetCart;

  const AppStateScope({
    super.key,
    required this.isDark,
    required this.cartCount,
    required this.toggleTheme,
    required this.addToCart,
    required this.resetCart,
    required Widget child,
  }) : super(child: child);

  static AppStateScope of(BuildContext context) {
    //of(context) → এটা child widget-কে সেই data এনে দেয়।
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    //cartCount ও isDark মান বদলালে child widget-কে জানাবে “rebuild হও”!
    return oldWidget.isDark != isDark || oldWidget.cartCount != cartCount;
  }
}

class AppStateContainer extends StatefulWidget {
  final Widget child;

  const AppStateContainer({super.key, required this.child});

  @override
  State<AppStateContainer> createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  bool _isDark = false;
  int _cartCount = 0;

  void _toggleTheme() => setState(() => _isDark = !_isDark);

  void _addToCart() => setState(() => _cartCount++);

  void _resetCart() => setState(() => _cartCount = 0);

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      isDark: _isDark,
      cartCount: _cartCount,
      toggleTheme: _toggleTheme,
      addToCart: _addToCart,
      resetCart: _resetCart,
      child: widget.child,
    );
  }
}

class AppStateDemo extends StatelessWidget {
  const AppStateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppStateScope.of(context).isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      home: AppStateDemoUi(),
    );
  }
}

//ui
class AppStateDemoUi extends StatelessWidget {
  const AppStateDemoUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const themeModeText()),
      body: Center(
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 250,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CartdBadge(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddToCartButton(),
                    SizedBox(width: 10),
                    ResetButton(),
                  ],
                ),
                SizedBox(height: 20),
                toogle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//dark
class themeModeText extends StatelessWidget {
  const themeModeText({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppStateScope.of(context).isDark;
    return Text(isDark ? 'Dark Mode' : 'Light Mode');
  }
}

//count
class CartdBadge extends StatelessWidget {
  CartdBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCount = AppStateScope.of(context).cartCount;
    return Text("Cart Count: $cartCount");
  }
}

//cart button
class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final addToCart = AppStateScope.of(context).addToCart;
    return ElevatedButton(
      onPressed: () {
        addToCart();
      },
      child: Text("Add To Cart"),
    );
  }
}

//reset
class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    final resetCart = AppStateScope.of(context).resetCart;
    return ElevatedButton(
      onPressed: () {
        resetCart();
      },
      child: Text("Reset"),
    );
  }
}

//toogle
class toogle extends StatelessWidget {
  const toogle({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleTheme = AppStateScope.of(context).toggleTheme;
    return ElevatedButton(
      onPressed: () {
        toggleTheme();
      },
      child: Text("Toogle Theme"),
    );
  }
}
