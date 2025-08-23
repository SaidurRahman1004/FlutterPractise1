/*
1. Draggable<T>
এটি হলো সেই উইজেট যা ব্যবহারকারী আঙুল দিয়ে টেনে সরাতে পারে। <T> অংশটি খুবই গুরুত্বপূর্ণ; একে Generic Type বলা হয়। এটি নির্ধারণ করে যে তুমি কোন ধরনের ডেটা (Data) এক জায়গা থেকে অন্য জায়গায় নিয়ে যাচ্ছো। এই ডেটা হতে পারে একটি String (নাম), int (সংখ্যা), Color, অথবা তোমার নিজের বানানো কোনো Object।

Draggable-এর গুরুত্বপূর্ণ প্রোপার্টি:

data: <T> টাইপের আসল ডেটা যা তুমি ড্র্যাগ করার সময় বহন করতে চাও। যেমন: একটি ফলের নাম "Apple"।
child: ড্র্যাগ শুরু করার আগে উইজেটটি স্বাভাবিক অবস্থায় কেমন দেখাবে।
feedback: ড্র্যাগ করার সময় ব্যবহারকারীর আঙুলের নিচে যে উইজেটটি ভাসমান অবস্থায় দেখা যায়। সাধারণত এটি child-এর একটি সামান্য পরিবর্তিত রূপ হয় (যেমন: কিছুটা স্বচ্ছ বা একটি শ্যাডোসহ)।
childWhenDragging: মূল উইজেটটিকে যখন ড্র্যাগ করে সরিয়ে নেওয়া হয়, তখন তার পুরোনো জায়গায় কী দেখা যাবে। সাধারণত এটি একটি খালি Container বা একটি placeholder হয়।

2. DragTarget<T>

এটি হলো সেই এলাকা যেখানে Draggable উইজেটটিকে এনে ছাড়া বা ড্রপ করা যায়। এর <T> টাইপ অবশ্যই Draggable-এর <T> টাইপের সাথে মিলতে হবে, নতুবা এটি ড্রপ গ্রহণ করবে না।
DragTarget-এর গুরুত্বপূর্ণ প্রোপার্টি:
builder: এই ফাংশনটি DragTarget উইজেটটি কেমন দেখাবে তা তৈরি করে। এটি তিনটি প্যারামিটার পায়: context, candidateData (যেসব Draggable আইটেম এর ওপর ভাসছে তাদের ডেটা), এবং rejectedData। candidateData-এর ওপর ভিত্তি করে তুমি টার্গেটের চেহারা পরিবর্তন করতে পারো (যেমন: কোনো আইটেম ওপরে এলে রঙ বদলে যাওয়া)।
onWillAccept: কোনো আইটেম ড্রপ করার ঠিক আগে এই ফাংশনটি কল হয়। তুমি যদি আইটেমটি গ্রহণ করতে চাও তবে true রিটার্ন করতে হবে, নাহলে false।
onAccept: যখন একটি Draggable সফলভাবে এর ওপর ড্রপ করা হয়, তখন এই ফাংশনটি কল হয়। তোমার মূল লজিক (যেমন: শপিং কার্টে আইটেম যোগ করা) এখানেই লিখতে হবে।
onLeave: যখন কোনো Draggable আইটেম ড্রপ না করে এর ওপর থেকে সরে যায়, তখন এটি কল হয়।

3. LongPressDraggable<T>
এটি Draggable-এর মতোই, কিন্তু ড্র্যাগ শুরু করার জন্য উইজেটটিকে কিছুক্ষণ চেপে ধরে রাখতে হয় (long press)। মোবাইলে ভুলবশত ড্র্যাগ হওয়া থেকে বাঁচতে এটি খুব কার্যকর।

2. গুরুত্বপূর্ণ Widgets:

Draggable<T>

যেটা টেনে নেওয়া হবে।
প্রপার্টি:
data: কী ডেটা বহন করবে (যেমন প্রোডাক্ট নাম)।
child: সাধারণ অবস্থায় কেমন দেখাবে।
feedback: ড্র্যাগ করার সময় কেমন দেখাবে।
childWhenDragging: যখন ড্র্যাগ হচ্ছে তখন মূল জায়গায় কী দেখাবে।

DragTarget<T>
যেখানে ড্রপ করা হবে।
প্রপার্টি:
onAccept(value): যখন ড্র্যাগকৃত আইটেম এখানে ফেলা হবে তখন কী করবে।
builder: UI বানাতে ব্যবহৃত হয় (যেমন যখন Target এ কিছু আসবে তখন রঙ পরিবর্তন করা)।
 */

//Practice Task 6.40 — Draggable & DragTarget (Drag-and-Drop UI) Ans ReSubmit:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistCartApp extends StatefulWidget {
  const WishlistCartApp({super.key});

  @override
  State<WishlistCartApp> createState() => _WishlistCartAppState();
}

class _WishlistCartAppState extends State<WishlistCartApp> {
  final List<Map<String, dynamic>> _products = [
    {'name': 'Laptop', 'icon': Icons.laptop_chromebook},
    {'name': 'Phone', 'icon': Icons.phone_android},
    {'name': 'Headphones', 'icon': Icons.headset},
    {'name': 'Tablet', 'icon': Icons.tablet_mac},
    {'name': 'Watch', 'icon': Icons.watch},
  ];

  final List<Map<String, dynamic>> _cartItems = [];
  final List<Map<String, dynamic>> _wishlistItems = [];

  bool _isCartHighlighted = false;
  bool _isWishlistHighlighted = false;

  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist & Cart")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Available Products',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: _products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return _buildProductCard(_products[index]);
                },
              ),
            ),
            const Divider(height: 30, thickness: 1),
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  ///Cart Ui
                  _buildDropTarget(
                    title: "Cart",
                    items: _cartItems,
                    highlightColor: Colors.blue,
                    isHighlighted: _isCartHighlighted,
                    icon: Icons.shopping_cart,
                    onAccept: (item) {
                      if (!_cartItems.any(
                        (cartItem) => cartItem['name'] == item['name'],
                      )) {
                        _cartItems.add(item);
                      }
                    },
                    onEnter: () => setState(() {
                      _isCartHighlighted = true;
                    }),
                    onLeave: () => setState(() {
                      _isCartHighlighted = false;
                    }),
                  ),

                  //Wishlist
                  _buildDropTarget(
                    title: "Wishlist",
                    items: _wishlistItems,
                    highlightColor: Colors.green,
                    isHighlighted: _isWishlistHighlighted,
                    icon: Icons.favorite,
                    onAccept: (item) {
                      if (!_wishlistItems.any(
                        (wiItem) => wiItem['name'] == item['name'],
                      )) {
                        _wishlistItems.add(item);
                      }
                    },
                    onEnter: () => setState(() {
                      _isWishlistHighlighted = true;
                    }),
                    onLeave: () => setState(() {
                      _isWishlistHighlighted = false;
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Draggable
  Widget _buildProductCard(Map<String, dynamic> product) {
    return Draggable<Map<String, dynamic>>(
      data: product,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(product['icon'], size: 32),
              SizedBox(height: 8),
              Text(product['name'], style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      feedback: Material(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(product['icon'], size: 32),
              SizedBox(height: 8),
              Text(product['name'], style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      childWhenDragging: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.yellowAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(product['icon'], size: 32),
            SizedBox(height: 8),
            Text(product['name'], style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Icon(Icons.downloading_sharp),
          ],
        ),
      ),
    );
  }

  //DragTarget Drop/Cart/Wishlist
  Widget _buildDropTarget({
    required String title, // টার্গেটের শিরোনাম।
    required List<Map<String, dynamic>> items,
    required Color highlightColor,
    required bool isHighlighted,
    required IconData icon,
    required Function(Map<String, dynamic>) onAccept,
    required VoidCallback onEnter,
    required VoidCallback onLeave,
  }) {
    return DragTarget<Map<String, dynamic>>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.all(16.00),
          width: double.infinity,
          decoration: BoxDecoration(
            color: isHighlighted
                ? highlightColor.withOpacity(0.5)
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHighlighted ? highlightColor : Colors.grey,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 30,
                color: isHighlighted ? highlightColor : Colors.grey.shade700,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              if (items.isEmpty)
                Text(
                  'Drag items here to add to $title',
                  style: TextStyle(color: Colors.grey.shade600),
                )
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: items
                      .map(
                        (item) => Chip(
                          avatar: Icon(item['icon'] as IconData, size: 18),
                          label: Text(item['name'] as String),
                          backgroundColor: highlightColor.withOpacity(0.1),
                          labelStyle: TextStyle(color: highlightColor),
                        ),
                      )
                      .toList(),
                ),
            ],
          ),
        );
      },
      onWillAccept: (data) {
        onEnter();
        return true;
      },
      onAccept: (data) {
        setState(() {
          onAccept(data);
          onLeave();
        });
        mysnk('${data['name']} added to ${title}', context);
      },
      onLeave: (data) {
        setState(() {
          onLeave();
        });
      },
    );
  }
}

////////////////////////////////////////////////////////////
//Practice Task 6.40 — Draggable & DragTarget (Drag-and-Drop UI) Ans Submit Gmini:

class GminiDragDrop extends StatefulWidget {
  const GminiDragDrop({super.key});

  @override
  State<GminiDragDrop> createState() => _GminiDragDropState();
}

class _GminiDragDropState extends State<GminiDragDrop> {
  List<String> tasks = [
    "Buy groceries",
    "Read book",
    "Do homework",
    "play Cricket",
    "Eat Rice",
  ];
  List<String> completedTasks = [];

  mysnk(msg, context) {
    // Snackbar দেখানোর ছোট utility ফাংশন
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 3),
      ), // ৩ সেকেন্ডের নোটিফিকেশন টোস্ট
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag & Drop Example")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Available Tasks',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  String currentTask = tasks[index];
                  return _builDrugabble(currentTask);
                },
              ),
            ),
            Divider(height: 30, thickness: 1),
            Text(
              'Droped tasks',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Expanded(child: _buildDropTarget()),
          ],
        ),
      ),
    );
  }

  //Drag&Show helper

  Widget _builDrugabble(String taskItem) {
    return Draggable<String>(
      data: taskItem,
      child: Chip(
        //Ui লিস্টে যা সো হবে!যাকে ড্রাগ করা হবে!
        label: Text(taskItem),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        backgroundColor: Colors.blue.shade100,
        // চিপের ব্যাকগ্রাউন্ড রঙ
        labelStyle: TextStyle(color: Colors.blue.shade800),
        avatar: CircleAvatar(
          // চিপের শুরুতে একটি আইকন (ঐচ্ছিক)
          backgroundColor: Colors.blue.shade700,
          child: Text(
            taskItem[0].toUpperCase(),
            style: TextStyle(color: Colors.white),
          ), // টাস্কের প্রথম অক্ষর
        ),
      ),
      feedback: Material(
        //ড্রাগ করা অবস্থাউ Ui যেমন হবে! উপরের child এই হবে জাস্ট হাল্কা কাস্টমাইজ যেন চেইঞ্জ বুঝা যায়!
        elevation: 4,
        child: Chip(
          label: Text(taskItem),
          padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
          backgroundColor: Colors.green.shade100,
          // চিপের ব্যাকগ্রাউন্ড রঙ
          labelStyle: TextStyle(color: Colors.red, fontSize: 16),
          avatar: CircleAvatar(
            // চিপের শুরুতে একটি আইকন (ঐচ্ছিক)
            backgroundColor: Colors.yellowAccent.shade700,
            child: Text(
              taskItem[0].toUpperCase(),
              style: TextStyle(color: Colors.white),
            ), // টাস্কের প্রথম অক্ষর
          ),
        ),
      ),
      childWhenDragging: Chip(
        // যখন ড্র্যাগ করা হচ্ছে, তখন মূল বা আগের জায়গায় কী দেখাবে !উপরের child এই হবে জাস্ট হাল্কা কাস্টমাইজ যেন চেইঞ্জ বুঝা যায়!
        label: Text(taskItem, style: TextStyle(color: Colors.grey.shade600)),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        backgroundColor: Colors.grey.shade300,
        // ড্র্যাগ করার সময় প্লেসহোল্ডারের রঙ
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade400,
          child: Icon(
            Icons.check_circle_outline,
            color: Colors.white70,
            size: 18,
          ),
        ),
      ),
    );
  }

  //Drop&Show Ui helper
  Widget _buildDropTarget() {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.all(16.00),
          height: 100,
          width: double.infinity,
          color: candidateData.isEmpty
              ? Colors.grey.shade100
              : Colors.yellowAccent.shade200,
          child: Column(
            children: [
              Text(
                'Drop tasks here to mark as completed',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Divider(height: 15, thickness: 1),
              completedTasks.isEmpty ?  // যদি completedTasks লিস্ট খালি হয়: hint টেক্সট তাইলে Drag items here to add to লেখা আসবে নাহলে ড্রাক করার পর আইটেম গুলো বসবে DragTarget এর বক্সে!
              Text(
                'Drag items here to add... ',
                style: TextStyle(color: Colors.grey.shade600),
              ) :
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: completedTasks.map((Taskcollected)=>Chip(
                      label: Text(Taskcollected, style: TextStyle(color: Colors.grey.shade600)),
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      backgroundColor: Colors.grey.shade300,
                      // ড্র্যাগ করার সময় প্লেসহোল্ডারের রঙ
                      avatar: CircleAvatar(
                        // চিপের শুরুতে একটি আইকন (ঐচ্ছিক)
                        backgroundColor: Colors.yellowAccent.shade700,
                        child: Text(
                          Taskcollected[0].toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ), // টাস্কের প্রথম অক্ষর
                      ),
                    )).toList(),
                  )


            ],
          ),
        );
      },
      onAccept: (data){ //Drag করে নির্দিষ্ট বক্সে DragTarget ডাটা রাখার পর যা হবে!
        setState(() {
          completedTasks.add(data);  // completedTasks লিস্টে ড্রাগ করা ডাটা যোগ হবে যা ui এর নির্দিষ্ট বক্সে DragTarget এ ড্রাগ করে রাখা ডাটা টি দেখা যাবে!
          tasks.remove(data);
          mysnk('${data} added', context);// // tasks লিস্টের সো করা  করা ডাটা রিমুভ হয়ে যাবে  যা ui এর উপর  Available Tasks দেখা যাবে না !বাদ চলে যাবে!!
        });
      },
    );
  }
}
