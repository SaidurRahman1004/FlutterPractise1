
///🧪 Practice Task 6.25:Ans::Flutter Stack Layout – UI Overlapping + Layering
import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgetFunction/CustomFunctions.dart';
//task1
class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Example"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage("https://luxurywatchbd.com/wp-content/uploads/2021/12/lmaiwescgjgvsdga.jpg"),fit: BoxFit.cover),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.45),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Smart Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.white),),
                SizedBox(height: 5,),
                ElevatedButton(onPressed: (){
                  cusSnk.customSnkbar(context, "You Cart this product");
                }, child: Text("Buy Now",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.redAccent),))

              ],
            ),
          ],
        ),
      ),

    );
  }
}

///Another Example task 2
class Stack2Ui extends StatelessWidget {
  const Stack2Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Example"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,
              left: 10,
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 80,
                width: 50,
                child: Icon(Icons.star,color: Colors.redAccent,size: 30,),
                
              ),
            ),

          ],

        ),
      ),

    );
  }
}


//SPractice Task 6.26:Ans: Flutter Stack + Positioned – Advanced Layout Techniques

class ProductCardStack extends StatelessWidget {
  const ProductCardStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Design Using Stack"),),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1510127034890-ba27508e9f1c?auto=format&fit=crop&w=800&q=60",),fit: BoxFit.cover,)
              ),

            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Camera",style: TextStyle(color: Colors.white, fontSize: 18,)),
                    Text("\$102.00",style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ElevatedButton(onPressed: (){}, child: Text("Buy Now"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange),


              ),
            )
          ],
        ),
      ),

    );
  }
}



//Ref Ai Copyed
/*
// এই ক্লাসের নাম ProductCardWithOverlay
class ProductCardWithOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // একটি মৌলিক মেটেরিয়াল ডিজাইন ভিজ্যুয়াল লেআউট কাঠামো তৈরি করে
      appBar: AppBar(title: Text("Product Card")),
      // অ্যাপ্লিকেশনের উপরে বার, যেখানে টাইটেল দেখানো হচ্ছে "Product Card"
      body: Center( // বডির কন্টেন্টকে স্ক্রিনের মাঝখানে রাখে
        child: Stack( // উইজেটগুলোকে একটির উপর আরেকটি স্তরবিন্যাস করতে ব্যবহৃত হয়
          children: [
            Container( // একটি কন্টেইনার যা কার্ডের الخلفপটের ছবি ধারণ করে
              width: 300, // কন্টেইনারের প্রস্থ ৩০০ পিক্সেল
              height: 200, // কন্টেইনারের উচ্চতা ২০০ পিক্সেল
              decoration: BoxDecoration( // কন্টেইনারের সজ্জা বা স্টাইল করার জন্য
                borderRadius: BorderRadius.circular(12),
                // কন্টেইনারের কোণাগুলো ১২ পিক্সেল ব্যাসার্ধে গোলাকার করা হয়েছে
                image: DecorationImage( // কন্টেইনারে একটি ছবি দেখানোর জন্য
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e"),
                  // নেটওয়ার্ক থেকে ছবি লোড করা হচ্ছে (এখানে একটি হেডফোনের ছবি)
                  fit: BoxFit
                      .cover, // ছবিটি কন্টেইনারের পুরো জায়গা জুড়ে দেখানোর জন্য (প্রয়োজনে ক্রপ হতে পারে)
                ),
              ),
            ),
            Positioned( // Stack এর মধ্যে একটি চাইল্ড উইজেটের অবস্থান নির্ধারণের জন্য ব্যবহৃত হয়
              bottom: 0, // নিচের দিক থেকে ০ পিক্সেল দূরত্বে (অর্থাৎ, একদম নিচে)
              left: 0, // বাম দিক থেকে ০ পিক্সেল দূরত্বে (অর্থাৎ, একদম বামে)
              right: 0, // ডান দিক থেকে ০ পিক্সেল দূরত্বে (অর্থাৎ, একদম ডানে)
              child: Container( // একটি কন্টেইনার যা ছবির উপরে একটি আংশিক স্বচ্ছ আস্তরণ এবং টেক্সট/বাটন ধারণ করে
                padding: EdgeInsets.all(10),
                // কন্টেইনারের ভেতরের কন্টেন্টের চারপাশে ১০ পিক্সেল প্যাডিং
                decoration: BoxDecoration( // কন্টেইনারের সজ্জা
                  color: Colors.black.withOpacity(0.5),
                  // কালো রঙের আংশিক স্বচ্ছ (৫০% অপাসিটি) ব্যাকগ্রাউন্ড
                  borderRadius: BorderRadius
                      .only( // শুধুমাত্র নিচের কোণাগুলো গোলাকার করা হচ্ছে
                    bottomLeft: Radius.circular(12),
                    // নিচের বাম কোণা ১২ পিক্সেল ব্যাসার্ধে গোলাকার
                    bottomRight: Radius.circular(
                        12), // নিচের ডান কোণা ১২ পিক্সেল ব্যাসার্ধে গোলাকার
                  ),
                ),
                child: Row( // একটি সারিতে উইজেটগুলো পাশাপাশি সাজানোর জন্য (এখানে টেক্সট এবং বাটন)
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,   // সারির প্রধান অক্ষ বরাবর (অনুভূমিকভাবে) উইজেটগুলোর মধ্যে সমান ফাঁকা জায়গা তৈরি করে Most Important
                  children: [
                    Text("Headphones",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    // "Headphones" লেখা, সাদা রঙ এবং ১৮ ফন্ট সাইজ
                    ElevatedButton( // একটি উত্তোলিত বাটন
                      onPressed: () {},
                      // বাটনে চাপ দিলে আপাতত কিছু হবে না (ফাঁকা ফাংশন)
                      child: Text("Buy"),
                      // বাটনের ভেতরে "Buy" লেখা
                      style: ElevatedButton.styleFrom(backgroundColor: Colors
                          .orange), // বাটনের স্টাইল, ব্যাকগ্রাউন্ডের রঙ কমলা

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */





