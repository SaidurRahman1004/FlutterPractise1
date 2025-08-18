/*
Carousel Slider কী?
Carousel Slider হলো একটি UI কম্পোনেন্ট যা একটি নির্দিষ্ট জায়গায় একাধিক আইটেম (সাধারণত ছবি বা কার্ড) একটির পর একটি স্লাইড-শো এর মতো করে দেখায়। এটি প্রায়ই অ্যাপের হোম স্ক্রিনে ব্যবহার করা হয় কোনো বিশেষ পণ্য, খবর বা ফিচার হাইলাইট করার জন্য।

PageView এবং Carousel Slider-এর মধ্যে পার্থক্য:
যদিও PageView দিয়ে ক্যারোসেল বানানো সম্ভব, কিন্তু carousel_slider-এর মতো বিশেষায়িত প্যাকেজগুলো আমাদের আরও অনেক সুবিধা দেয় যা PageView এ ডিফল্টভাবে থাকে না। যেমন:
Auto Play: স্লাইডারটি নিজে থেকেই নির্দিষ্ট সময় পর পর স্লাইড হতে থাকে।
Infinite Scroll: শেষ স্লাইডে পৌঁছানোর পর আবার প্রথম স্লাইড থেকে শুরু হয়, একটি চক্রের মতো।
Custom Viewport: স্ক্রিনে একই সাথে একাধিক আইটেম (যেমন: মাঝেরটা বড় এবং পাশের গুলো ছোট) দেখানো যায়।
সহজ কনফিগারেশন: অনেক জটিল ফিচার খুব সহজেই options এর মাধ্যমে চালু বা বন্ধ করা যায়।

carousel_slider প্যাকেজ
এটি Flutter-এর অন্যতম জনপ্রিয় একটি প্যাকেজ যা দিয়ে খুব সহজেই সুন্দর এবং শক্তিশালী ক্যারোসেল তৈরি করা যায়।

প্রধান উইজেট ও ক্লাস:
CarouselSlider: এটি মূল উইজেট যা স্লাইডারটি তৈরি করে।
CarouselOptions: CarouselSlider এর আচরণ এবং görünüm নিয়ন্ত্রণ করার জন্য এই ক্লাসটি ব্যবহার করা হয়। প্রায় সব কাস্টমাইজেশন এখানেই করা হয়।

CarouselOptions-এর গুরুত্বপূর্ণ প্রোপার্টি:

height: স্লাইডারের উচ্চতা নির্ধারণ করে।
aspectRatio: স্লাইডারের প্রস্থ এবং উচ্চতার অনুপাত ঠিক করে (যেমন: 16/9)। height এবং aspectRatio এর মধ্যে একটি ব্যবহার করলেই চলে।
viewportFraction: একটি স্ক্রিনে প্রতিটি আইটেম কতটুকু জায়গা নেবে তা নির্ধারণ করে। মান 1.0 দিলে পুরো প্রস্থ জুড়ে একটি আইটেম দেখাবে। 0.8 দিলে পাশের আইটেমের কিছু অংশ দেখা যাবে।
initialPage: স্লাইডারটি কোন আইটেম থেকে শুরু হবে।
enableInfiniteScroll: চক্রাকার স্ক্রোলিং চালু (true) বা বন্ধ (false) করে। ডিফল্ট true।
autoPlay: স্বয়ংক্রিয়ভাবে স্লাইড হওয়া চালু (true) বা বন্ধ (false) করে।
autoPlayInterval: কত সময় পর পর স্লাইড পরিবর্তন হবে (যেমন: Duration(seconds: 3))।
enlargeCenterPage: true দিলে মাঝের আইটেমটি অন্যগুলোর চেয়ে বড় দেখাবে।
onPageChanged: পেজ পরিবর্তন হলে এই ফাংশন কল হয়, যা ইন্ডিকেটর আপডেট করতে কাজে লাগে।
scrollDirection: স্লাইডের দিক Axis.horizontal বা Axis.vertical নির্ধারণ করে।

উইজেট ট্রি (Widget Tree) ডায়াগ্রাম:
Scaffold
└── body: Center
    └── CarouselSlider
        ├── items: [
        │   ├── Container 1 (Image/Card)
        │   ├── Container 2 (Image/Card)
        │   └── ...
        └── options: CarouselOptions(...)
 */

import 'package:flutter/material.dart'; // ফ্লাটারের ম্যাটেরিয়াল ডিজাইন কম্পোনেন্ট ইম্পোর্ট করা হয়েছে।
import 'package:carousel_slider/carousel_slider.dart'; // carousel_slider প্যাকেজ ইম্পোর্ট করা হয়েছে।

class CarouselBasic extends StatefulWidget {
  // CarouselBasic নামে একটি StatefulWidget তৈরি করা হয়েছে।
  const CarouselBasic({super.key}); // কনস্ট্রাক্টর।

  @override
  State<CarouselBasic> createState() =>
      _CarouselBasicState(); // স্টেট অবজেক্ট তৈরি করা হয়েছে।
}

class _CarouselBasicState extends State<CarouselBasic> {
  // CarouselBasic এর স্টেট ক্লাস।
  int _currentIndex = 0; // বর্তমান স্লাইডের ইনডেক্স ট্র্যাক করার জন্য একটি ভেরিয়েবল।

  final List<String> imgList = [ // ছবির URL গুলোর একটি লিস্ট।
    "https://images.unsplash.com/photo-1606813902775-002c94b2b824",
    "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
    "https://images.unsplash.com/photo-1519125323398-675f0ddb6308",
  ];

  @override
  Widget build(BuildContext context) {
    // UI তৈরি করার মেথড।
    return Scaffold( // অ্যাপের মূল কাঠামো।
      appBar: AppBar(title: Text("Carousel Slider Example")),
      // অ্যাপবার যেখানে টাইটেল দেখানো হচ্ছে।
      body: Column( // কলাম উইজেট, যা চাইল্ড উইজেটগুলোকে উল্লম্বভাবে সাজায়।
        children: [
          // Carousel Slider
          CarouselSlider( // ক্যারোসেল স্লাইডার উইজেট।
            items: imgList.map((
                url) { // imgList এর প্রতিটি URL এর জন্য একটি করে আইটেম তৈরি হচ্ছে।
              return Container( // প্রতিটি আইটেম একটি কন্টেইনার।
                margin: EdgeInsets.all(8), // কন্টেইনারের চারপাশে মার্জিন।
                decoration: BoxDecoration( // কন্টেইনারের ডেকোরেশন।
                  borderRadius: BorderRadius.circular(12),
                  // কন্টেইনারের কোণাগুলো গোলাকার করা হয়েছে।
                  image: DecorationImage( // কন্টেইনারে ছবি দেখানোর জন্য।
                    image: NetworkImage(url),
                    // নেটওয়ার্ক থেকে ছবি লোড করা হচ্ছে।
                    fit: BoxFit
                        .cover, // ছবিটি কন্টেইনারকে সম্পূর্ণভাবে ঢেকে ফেলবে।
                  ),
                ),
              );
            }).toList(), // map() থেকে পাওয়া আইটেমগুলোকে লিস্টে পরিণত করা হয়েছে।
            options: CarouselOptions( // ক্যারোসেল স্লাইডারের অপশনস কনফিগার করা হচ্ছে।
              height: 250,
              // স্লাইডারের উচ্চতা ২৫০ পিক্সেল।
              enlargeCenterPage: true,
              // মাঝখানের স্লাইডটি বড় করে দেখানো হবে।
              autoPlay: true,
              // স্লাইডারটি স্বয়ংক্রিয়ভাবে প্লে হবে।
              autoPlayInterval: Duration(seconds: 3),
              // প্রতি ৩ সেকেন্ড পর পর স্লাইড পরিবর্তন হবে।
              viewportFraction: 0.9,
              // প্রতিটি স্লাইড স্ক্রিনের ৯০% জায়গা নেবে, যাতে পাশের স্লাইডের কিছু অংশ দেখা যায়।
              onPageChanged: (index,
                  reason) { // যখন স্লাইড পরিবর্তন হবে, এই ফাংশনটি কল হবে।
                setState(() { // UI আপডেট করার জন্য setState কল করা হয়েছে।
                  _currentIndex =
                      index; // বর্তমান স্লাইডের ইনডেক্স আপডেট করা হয়েছে।
                });
              },
            ),
          ),

          // Indicator Dots
          Row( // ইন্ডিকেটর ডটগুলোকে একটি সারিতে দেখানোর জন্য Row উইজেট।
            mainAxisAlignment: MainAxisAlignment.center,
            // ডটগুলোকে মাঝখানে অ্যালাইন করা হয়েছে।
            children: imgList
                .asMap()
                .entries
                .map((
                entry) { // imgList এর প্রতিটি আইটেমের জন্য একটি করে ডট তৈরি হচ্ছে।
              return GestureDetector( // ডটটিকে ট্যাপ করার সুবিধা দেওয়ার জন্য।
                onTap: () {},
                // ট্যাপ করলে কী হবে তা এখানে ডিফাইন করা যায় (বর্তমানে খালি)।
                child: Container( // প্রতিটি ডট একটি কন্টেইনার।
                  width: 12,
                  // ডটের প্রস্থ ১২ পিক্সেল।
                  height: 12,
                  // ডটের উচ্চতা ১২ পিক্সেল।
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  // ডটের চারপাশে মার্জিন।
                  decoration: BoxDecoration( // ডটের ডেকোরেশন।
                    shape: BoxShape.circle, // ডটটিকে গোলাকার আকৃতি দেওয়া হয়েছে।
                    color: _currentIndex == entry
                        .key // ডটের রঙ পরিবর্তন করা হচ্ছে বর্তমান স্লাইডের উপর ভিত্তি করে।
                        ? Colors
                        .blue // যদি ডটটি বর্তমান স্লাইডের সাথে মিলে যায়, তাহলে নীল রঙ।
                        : Colors.grey, // অন্যথায় ধূসর রঙ।
                  ),
                ),
              );
            }).toList(), // map() থেকে পাওয়া ডটগুলোকে লিস্টে পরিণত করা হয়েছে।
          ),
        ],
      ),
    );
  }
}