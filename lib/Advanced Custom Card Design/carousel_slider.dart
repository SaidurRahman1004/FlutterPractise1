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
  int _currentIndex =
  0; // বর্তমান স্লাইডের ইনডেক্স ট্র্যাক করার জন্য একটি ভেরিয়েবল।

  final List<String> imgList = [
    // ছবির URL গুলোর একটি লিস্ট।
    "https://images.unsplash.com/photo-1606813902775-002c94b2b824",
    "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f",
    "https://images.unsplash.com/photo-1519125323398-675f0ddb6308",
  ];

  @override
  Widget build(BuildContext context) {
    // UI তৈরি করার মেথড।
    return Scaffold(
      // অ্যাপের মূল কাঠামো।
      appBar: AppBar(title: Text("Carousel Slider Example")),
      // অ্যাপবার যেখানে টাইটেল দেখানো হচ্ছে।
      body: Column(
        // কলাম উইজেট, যা চাইল্ড উইজেটগুলোকে উল্লম্বভাবে সাজায়।
        children: [
          // Carousel Slider
          CarouselSlider(
            // ক্যারোসেল স্লাইডার উইজেট।
            items: imgList.map((url) {
              // imgList এর প্রতিটি URL এর জন্য একটি করে আইটেম তৈরি হচ্ছে।
              return Container(
                // প্রতিটি আইটেম একটি কন্টেইনার।
                margin: EdgeInsets.all(8), // কন্টেইনারের চারপাশে মার্জিন।
                decoration: BoxDecoration(
                  // কন্টেইনারের ডেকোরেশন।
                  borderRadius: BorderRadius.circular(12),
                  // কন্টেইনারের কোণাগুলো গোলাকার করা হয়েছে।
                  image: DecorationImage(
                    // কন্টেইনারে ছবি দেখানোর জন্য।
                    image: NetworkImage(url),
                    // নেটওয়ার্ক থেকে ছবি লোড করা হচ্ছে।
                    fit: BoxFit
                        .cover, // ছবিটি কন্টেইনারকে সম্পূর্ণভাবে ঢেকে ফেলবে।
                  ),
                ),
              );
            }).toList(), // map() থেকে পাওয়া আইটেমগুলোকে লিস্টে পরিণত করা হয়েছে।
            options: CarouselOptions(
              // ক্যারোসেল স্লাইডারের অপশনস কনফিগার করা হচ্ছে।
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
              onPageChanged: (index, reason) {
                // যখন স্লাইড পরিবর্তন হবে, এই ফাংশনটি কল হবে।
                setState(() {
                  // UI আপডেট করার জন্য setState কল করা হয়েছে।
                  _currentIndex =
                      index; // বর্তমান স্লাইডের ইনডেক্স আপডেট করা হয়েছে।
                });
              },
            ),
          ),

          // Indicator Dots
          Row(
            // ইন্ডিকেটর ডটগুলোকে একটি সারিতে দেখানোর জন্য Row উইজেট।
            mainAxisAlignment: MainAxisAlignment.center,
            // ডটগুলোকে মাঝখানে অ্যালাইন করা হয়েছে।
            children: imgList
                .asMap()
                .entries
                .map((entry) {
              // imgList এর প্রতিটি আইটেমের জন্য একটি করে ডট তৈরি হচ্ছে।
              return GestureDetector(
                // ডটটিকে ট্যাপ করার সুবিধা দেওয়ার জন্য।
                onTap: () {},
                // ট্যাপ করলে কী হবে তা এখানে ডিফাইন করা যায় (বর্তমানে খালি)।
                child: Container(
                  // প্রতিটি ডট একটি কন্টেইনার।
                  width: 12,
                  // ডটের প্রস্থ ১২ পিক্সেল।
                  height: 12,
                  // ডটের উচ্চতা ১২ পিক্সেল।
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  // ডটের চারপাশে মার্জিন।
                  decoration: BoxDecoration(
                    // ডটের ডেকোরেশন।
                    shape: BoxShape.circle, // ডটটিকে গোলাকার আকৃতি দেওয়া হয়েছে।
                    color:
                    _currentIndex ==
                        entry
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

/////////////////////////////////Practice Task 6.35 — Carousel Slider (Image/Product Slider)////////////////////////
class SliddersImg extends StatefulWidget {
  const SliddersImg({super.key});

  @override
  State<SliddersImg> createState() => _SliddersImgState();
}

class _SliddersImgState extends State<SliddersImg> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  final List<Map<String, dynamic>> productList = [
    {
      'title': 'Stunning Watch',
      'imageUrl':
      'https://images.unsplash.com/photo-1524805444758-089113d48a6d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Leather Bag',
      'imageUrl':
      'https://images.unsplash.com/photo-1547949003-9792a18a2601?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Stylish Shoes',
      'imageUrl':
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Modern Camera',
      'imageUrl':
      'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'isLast': true, // শেষ আইটেমটি চিহ্নিত করার জন্য
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Slider Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: productList.length,
            //carouselController: _controller,
            itemBuilder: (context, index, realIndx) {
              final productl = productList[index];
              return Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(productl['imageUrl']),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: productList
                .asMap()
                .entries
                .map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToItem(entry.key),
                child: Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////Another
//Practice Task 6.35 — Carousel Slider (Image/Product Slider) Ans:Submit
class craslider extends StatefulWidget {
  const craslider({super.key});

  @override
  State<craslider> createState() => _crasliderState();
}

class _crasliderState extends State<craslider> {
  final List<Map<String, dynamic>> productList = [
    {
      'title': 'Stunning Watch',
      'imageUrl':
      'https://images.unsplash.com/photo-1524805444758-089113d48a6d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Leather Bag',
      'imageUrl':
      'https://images.unsplash.com/photo-1547949003-9792a18a2601?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Stylish Shoes',
      'imageUrl':
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    },
    {
      'title': 'Modern Camera',
      'imageUrl':
      'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'isLast': true, // শেষ আইটেমটি চিহ্নিত করার জন্য
    },
  ];
  int _currentIndex = 0;

  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Slider Example")),
      body: Column(
        children: [
          CarouselSlider(
            items: productList.map((proItems) {
              return proItems['isLast'] == true
                  ? Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(proItems['imageUrl']),
                          fit: BoxFit.cover,
                          opacity: 0.3,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () =>
                          mysnk("Redirecting to Shop...", context),
                      child: Text("Shop Now"),
                    ),
                  ],
                ),
              )
                  : Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(proItems['imageUrl']),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
                  (index) =>
                  Container(
                    width: 12,
                    height: 12,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

//.............................................................................
/////Gmini Practice Task 6.35 — Carousel Slider (Image/Product Slider) Ans:Submit
class crsliderGmni extends StatefulWidget {
  const crsliderGmni({super.key});

  @override
  State<crsliderGmni> createState() => _crsliderGmniState();
}

class _crsliderGmniState extends State<crsliderGmni> {
  int _currentIndex = 0;

  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  final List<Map<String, dynamic>> featureList = [
    {
      'title': 'App DevelopMent',
      'description': 'Flutter,Dart,Firebase',
      'imageUrl':
      'https://5.imimg.com/data5/SELLER/Default/2022/10/ED/KT/EP/139802061/whatsapp-image-2022-09-02-at-5-39-16-pm-500x500.jpeg',
    },

    {
      'title': 'Web DevelopMent',
      'description': 'Web Development Course in Chandigarh | 100% Placement',
      'imageUrl':
      'data:image/png;base64,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',
    },

    {
      'title': 'DevOps',
      'description': 'DevOps and the application lifecycle',
      'imageUrl':
      'https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/what-is-devops_lifecycle?resMode=sharp2&op_usm=1.5,0.65,15,0&wid=847&hei=502&qlt=75&fit=constrain',
    },

    {
      'title': 'Machine learning',
      'description':
      'Machine learning is a branch of artificial intelligence (AI) ',
      'imageUrl':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMS2DFRjgDSjS3UMMdU0x6MC1dZs0e8Kg6mA&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learning Dot"), backgroundColor: Colors.blue),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: featureList.length,
                itemBuilder: (context, index, realIndex) {
                  final feature = featureList[index];
                  return InkWell(
                    onTap: ()=>mysnk("Enrolled", context),
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        shadowColor: Colors.blue,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: Image.network(
                                feature['imageUrl'],
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                            )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feature['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,),
                                ),
                                SizedBox(height: 10,),
                                Chip(
                                  label: Text("Lifetime Access"),
                                  labelStyle: TextStyle(color: Colors.redAccent),
                                ),
                                SizedBox(height: 10,),
                                Text(feature['description'],style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              
                              
                              
                              
                              ],
                              
                              
                            ),
                              
                          )
                        ],
                      ),
                              
                              
                              
                    ),
                  );},
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  autoPlayInterval: Duration(seconds: 3),
                  enableInfiniteScroll: false,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason){
                    setState(() {
                      _currentIndex=index;
                    });
                  }
          
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(featureList.length, (index){
                  return Container(
                    height: 10,
                    width: 12,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                    ),
          
                  );
                })
              )
            ],
          ),
        ),
      ),
    );
  }
}
