import 'package:flutter/material.dart';


/// StatefulWidget Widget Simple Flutter Counter App
/*
✅ এই প্রজেক্ট কী করে?
🔸 এটি একটি Simple Counter App
🔸 ইউজার ➕ বাটনে চাপ দিলে সংখ্যা বাড়ে
🔸 ইউজার ➖ বাটনে চাপ দিলে সংখ্যা কমে
🔸 UI StatefulWidget দিয়ে তৈরি — যাতে ইউজার Interaction এর পর UI আপডেট হয়।
 */
/*
class practisePage extends StatefulWidget {                        // 🔹 ১. এটি একটি StatefulWidget ক্লাস ডিফাইন করে।
  const practisePage({super.key});                                // 🔹 ২. কনস্ট্রাক্টর ডিফাইন, অপশনাল কী গ্রহণ করে।

  @override
  State<practisePage> createState() => _practisePageState();      // 🔹 ৩. এটি স্টেট তৈরি করে এবং নিচের State ক্লাসকে কল করে।
}

class _practisePageState extends State<practisePage> {            // 🔹 ৪. এই ক্লাসে আমাদের অ্যাপের পরিবর্তনশীল UI থাকবে।

  int count = 0;                                                  // 🔹 ৫. এটি Counter ভ্যালু ট্র্যাক করার জন্য একটি ভ্যারিয়েবল।

  @override
  Widget build(BuildContext context) {                            // 🔹 ৬. UI তৈরি করে build() ফাংশনের মাধ্যমে।
    return MaterialApp(                                           // 🔹 ৭. অ্যাপ রান করানোর জন্য MaterialApp রিটার্ন করে।
      debugShowCheckedModeBanner: false,                          // 🔹 ৮. উপরের debug banner লুকায়।

      home: Scaffold(                                             // 🔹 ৯. Scaffold দিয়ে basic layout তৈরি করে।

        appBar: AppBar(                                           // 🔹 ১০. অ্যাপের টপ বারে AppBar দেখায়।
          title: Text("Counter"),                                 // 🔹 ১১. AppBar-এ টাইটেল “Counter” লেখা থাকে।
          backgroundColor: Colors.deepPurple,                     // 🔹 ১২. AppBar-এর ব্যাকগ্রাউন্ড deep purple।
        ),

        body: Center(                                             // 🔹 ১৩. Body অংশের সকল কন্টেন্ট Center-এ রাখে।
          child: Column(                                          // 🔹 ১৪. Column widget দিয়ে Child UI উপরে নিচে সাজায়।
            children: [

              Container(                                          // 🔹 ১৫. এটি একটি Box তৈরি করে।
                alignment: Alignment.center,                      // 🔹 ১৬. Box-এর ভিতরের কন্টেন্টকে সেন্টারে রাখে।
                height: 300,                                      // 🔹 ১৭. Box-এর উচ্চতা ৩০০।
                width: 300,                                       // 🔹 ১৮. Box-এর প্রস্থ ৩০০।
                color: Colors.blue,                               // 🔹 ১৯. Box-এর ব্যাকগ্রাউন্ড কালার নীল।

                child: Column(                                    // 🔹 ২০. Box-এর ভিতরে আবার একটি Column রাখে।
                  mainAxisAlignment: MainAxisAlignment.center,    // 🔹 ২১. ভিতরের Column কন্টেন্ট সেন্টার করে।

                  children: [
                    Text(                                         // 🔹 ২২. Counter সংখ্যা দেখায় (যেমন: 0, 1, 2...)।
                      count.toString(),                           // 🔹 ২৩. int → String কনভার্ট করে দেখায়।
                      style: TextStyle(                           // 🔹 ২৪. টেক্সটের স্টাইলিং।
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 10,),                        // 🔹 ২৫. Counter ও বাটনের মাঝে ১০ px ফাঁকা।

                    Row(                                          // 🔹 ২৬. ➕ ও ➖ বাটন দুইটি এক লাইনে দেখানোর জন্য Row।
                      mainAxisAlignment: MainAxisAlignment.center, // 🔹 ২৭. বাটনগুলো মাঝখানে রাখে।

                      children: [

                        OutlinedButton(                           // 🔹 ২৮. ➕ বাটনের জন্য OutlinedButton।
                          onPressed: () {
                            setState(() {
                              count++;                            // 🔹 ২৯. বাটনে চাপ দিলে count বাড়ে।
                            });
                          },
                          child: Icon(                            // 🔹 ৩০. বাটনে একটি + আইকন।
                            Icons.add,
                            size: 30,
                            color: Colors.yellow,
                          ),
                        ),

                        SizedBox(width: 10,),                     // 🔹 ৩১. ➕ ও ➖ বাটনের মাঝে ফাঁকা।

                        OutlinedButton(                           // 🔹 ৩২. ➖ বাটনের জন্য OutlinedButton।
                          onPressed: () {
                            setState(() {
                              count--;                            // 🔹 ৩৩. বাটনে চাপ দিলে count কমে।
                            });
                          },
                          child: Icon(                            // 🔹 ৩৪. বাটনে একটি - আইকন।
                            Icons.remove,
                            size: 30,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 */

