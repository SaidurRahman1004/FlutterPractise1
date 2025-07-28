import 'package:flutter/material.dart';

// 1. StatefulWidget ক্লাস
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  // এর কাজ শুধু State অবজেক্ট তৈরি করা
  State<CounterWidget> createState() => _CounterWidgetState();
}

// 2. State ক্লাস
class _CounterWidgetState extends State<CounterWidget> {
  // এই _counter ভ্যারিয়েবলটি হলো 'State' যা পরিবর্তন হবে
  int _counter = 0;

  // এই ফাংশনটি State পরিবর্তন করবে
  void _incrementCounter() {
    // setState() কল করা হচ্ছে
    setState(() {
      // এখানে State পরিবর্তন করা হয়
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState() কল হওয়ার পর এই build মেথড আবার রান করে
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('You have pushed the button this many times:'),
        Text(
          '$_counter', // UI নতুন _counter ভ্যালু দিয়ে আপডেট হয়
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter, // বাটনে চাপ দিলে ফাংশনটি কল হবে
          child: const Text('Increment'),
        ),
      ],
    );
  }
}