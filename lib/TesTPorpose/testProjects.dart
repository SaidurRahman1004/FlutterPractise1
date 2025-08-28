import 'package:flutter/material.dart';


class JustTest extends StatelessWidget {
  const JustTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // --- আমাদের স্টেট ---
  int _counter = 0;

  // --- স্টেট পরিবর্তন করার মেথড ---
  void _incrementCounter() {
    // setState কল করা হচ্ছে Flutter-কে জানানোর জন্য যে স্টেট পরিবর্তন হয়েছে
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build method called!'); // প্রতিবার setState কল হলে এটি প্রিন্ট হবে

    return Scaffold(
      appBar: AppBar(title: const Text('setState Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter', // UI স্টেট-এর উপর নির্ভরশীল
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // বাটন ক্লিক করলে স্টেট পরিবর্তন হবে
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}