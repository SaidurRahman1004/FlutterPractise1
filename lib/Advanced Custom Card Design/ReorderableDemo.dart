import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*
১. তত্ত্ব (Explanation)
ReorderableListView কী?
ReorderableListView হলো ListView-এর একটি বিশেষ সংস্করণ যা ব্যবহারকারীকে
লিস্টের আইটেমগুলোকে long-press করে (অনেকক্ষণ চেপে ধরে) টেনে এনে তাদের வரிசை (order) পরিবর্তন করার সুযোগ দেয়।

আমরা আগের ধাপে Draggable এবং DragTarget ব্যবহার করে manualmente ড্র্যাগ-অ্যান্ড-ড্রপ শিখেছি।
ReorderableListView সেই কাজটিকেই অনেক সহজ করে দেয়, কারণ এটি বিশেষভাবে লিস্টের আইটেম পুনর্বিন্যাস করার জন্যই তৈরি করা হয়েছে। তোমাকে আর আলাদা করে Draggable বা DragTarget নিয়ে ভাবতে হবে না।

সাধারণ ব্যবহার:

To-Do অ্যাপ: কাজের গুরুত্ব অনুযায়ী টাস্কগুলোকে ওপরে বা নিচে সরানো।
মিউজিক প্লে-লিস্ট: গানের வரிசை পরিবর্তন করা।
ফটো গ্যালারি: ছবি সাজানো।

গুরুত্বপূর্ণ প্রোপার্টি এবং ধারণা
children বা itemBuilder: সাধারণ ListView-এর মতোই তুমি children দিয়ে স্ট্যাটিক আইটেম অথবা ReorderableListView.builder দিয়ে ডাইনামিক আইটেম তৈরি করতে পারো।

Key (অত্যন্ত গুরুত্বপূর্ণ): ReorderableListView-এর প্রতিটি চাইল্ড উইজেটের একটি অনন্য Key থাকতে হবে। এই Key ব্যবহার করে
Flutter বুঝতে পারে কোন আইটেম কোনটি, বিশেষ করে যখন তাদের வரிசை পরিবর্তন হয়। Key ছাড়া এটি সঠিকভাবে কাজ করবে না। সাধারণত ValueKey বা Key ব্যবহার করা হয়।
.............................................................
গুরুত্বপূর্ণ টিপস

key ইউনিক না হলে আইটেম জাম্প/বাগ দেখায়—ValueKey(item) use করো।
onReorder-এ if (newIndex > oldIndex) newIndex -= 1; দরকার—Flutter আইটেম রিমুভ করার পর ইনডেক্স শিফট হয়।
হ্যান্ডেল দরকার হলে buildDefaultDragHandles: false দিয়ে ReorderableDragStartListener ব্যবহার করো।
,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ReorderableListView → লিস্ট তৈরি করেছে যেখানে আইটেম ড্র্যাগ করে সরানো যায়।
key: ValueKey(tasks[index]) → প্রতিটি আইটেমকে ইউনিকভাবে চেনার জন্য দরকার।
onReorder(oldIndex, newIndex) →
oldIndex = কোন পজিশন থেকে আইটেম সরানো হলো
newIndex = কোন পজিশনে আইটেম রাখা হলো
আমরা লিস্ট থেকে আইটেম রিমুভ করে নতুন পজিশনে ইনসার্ট করছি।
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
. সহজভাবে ভাবো:

onReorder হলো বাস্তবে ঘরের জিনিসপত্র স্থানান্তরের মতো। তুমি যদি বলো:
পুরনো অবস্থান = পুরনো জায়গা (Old Index)
নতুন অবস্থান = যেখানে রাখবে (New Index)
তুমি পুরনো জায়গা থেকে জিনিস সরিয়ে নতুন জায়গায় রাখছো → এটাই কোডে হচ্ছে।
,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

ListTile(
  key: ValueKey(itemObject), // প্রতিটি আইটেমের জন্য অনন্য Key
  title: Text(itemObject.name),
)

onReorder (সবচেয়ে গুরুত্বপূর্ণ কলব্যাক): এটিই ReorderableListView-এর মূল অংশ। যখন ব্যবহারকারী একটি আইটেমকে নতুন অবস্থানে নিয়ে গিয়ে ছেড়ে দেয় (ড্রপ করে), তখন এই ফাংশনটি কল হয়। এটি দুটি প্যারামিটার দেয়:
int oldIndex: আইটেমটির পুরোনো অবস্থান।
int newIndex: আইটেমটির নতুন অবস্থান।

এই ফাংশনের ভেতরে তোমাকে setState কল করে তোমার মূল ডেটা লিস্টকে (data source) আপডেট করতে হবে।

onReorder-এর ভেতরের লজিক
লিস্ট আপডেট করার যুক্তিটি একটু সতর্কতার সাথে লিখতে হয়:

onReorder: (int oldIndex, int newIndex) {
  setState(() {
    // যদি একটি আইটেমকে টেনে নিচের দিকে নামানো হয়,
    // তাহলে newIndex-এর মান এক বেড়ে যায় কারণ পুরোনো আইটেমটি তখনো লিস্টে থাকে।
    // তাই newIndex থেকে ১ বিয়োগ করতে হয়।
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    // ১. প্রথমে পুরোনো অবস্থান থেকে আইটেমটিকে রিমুভ করো।
    final String item = _items.removeAt(oldIndex);

    // ২. এরপর নতুন অবস্থানে আইটেমটিকে যুক্ত করো।
    _items.insert(newIndex, item);
  });
}


,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
ব্যবহারকারী একটি আইটেম টানে: আপনি যখন একটি আইটেম চেপে ধরে টানেন, ReorderableListView দেখতে খুব সুন্দরভাবে কাজটি করে। কিন্তু এটি শুধু ظاهريভাবে (visually) আইটেমটিকে সরায়। পেছনের ডেটা লিস্টে (যেমন: আপনার গানের তালিকা) তখনও কোনো পরিবর্তন হয় না।

ব্যবহারকারী আইটেমটি ছাড়ে: যেই মুহূর্তে আপনি আইটেমটি নতুন জায়গায় ছেড়ে দেবেন, ঠিক সেই মুহূর্তে onReorder ফাংশনটি কল হবে।

onReorder আপনাকে দুটি তথ্য দেয়:

oldIndex: আইটেমটি টানার আগে কত নম্বর পজিশনে ছিল।

newIndex: আইটেমটিকে ছেড়ে দেওয়ার পর সে নতুন কোন পজিশনে গিয়েছে।

আপনার কাজ: এই oldIndex এবং newIndex ব্যবহার করে আপনার মূল ডেটা লিস্টকে আপডেট করতে হবে। যদি আপনি এই কাজটি না করেন, তবে আইটেমটি ظاهريভাবে সরার পর আবার তার আগের জায়গায় ফেরত চলে যাবে, কারণ মূল ডেটা পরিবর্তন হয়নি।

বাস্তব উদাহরণ (প্লে-লিস্ট):

আপনার গানের লিস্ট: ['Song A', 'Song B', 'Song C', 'Song D']

আপনি 'Song C' (যার oldIndex = 2) টেনে এনে 'Song A'-এর পরে রাখলেন (যার newIndex হবে 1)।

onReorder কল হবে এবং আপনাকে oldIndex = 2 এবং newIndex = 1 দেবে।

এখন আপনার কাজ হলো এই তথ্য ব্যবহার করে মূল লিস্টকে পরিবর্তন করা।

,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
onReorder এর ভেতরের লজিকটির গভীর ব্যাখ্যা:
final String item = _shoppingItems.removeAt(oldIndex);: প্রথমে আমরা লিস্ট থেকে পুরনো পজিশনের (oldIndex) আইটেমটিকে সরিয়ে ফেলি এবং একটি ভ্যারিয়েবলে সংরক্ষণ করি।

_shoppingItems.insert(newIndex, item);: এরপর, সেই সরানো আইটেমটিকে লিস্টের নতুন পজিশনে (newIndex) যোগ করি।

if (newIndex > oldIndex) { newIndex -= 1; }: এই লাইনটি একটু জটিল মনে হতে পারে। যখন আপনি লিস্ট থেকে একটি আইটেম সরিয়ে ফেলেন, তখন লিস্টের আকার ছোট হয়ে যায়। ফলে, আপনি যদি একটি আইটেমকে নিচের দিকে সরান, তাহলে নতুন পজিশনটি এক ঘর কমে যায়। এই লাইনটি সেই হিসাবটি ঠিক রাখে।
 */

//Practice Task 6.41 — ReorderableListView Ans Submit:

class ReorderCategoriesEx extends StatefulWidget {
  const ReorderCategoriesEx({super.key});

  @override
  State<ReorderCategoriesEx> createState() => _ReorderCategoriesExState();
}

class _ReorderCategoriesExState extends State<ReorderCategoriesEx> {
  final List<String> _shoppingItems = [
    'Electronics 💻',
    'Fashion & Apparel 👕',
    'Groceries 🛒',
    'Home & Kitchen 🏠',
    'Books & Stationery 📚',
    'Health & Beauty 💄',
    'Toys & Games 🎮',
    'Sports & Outdoors 🚴',
    'Automotive 🚗',
    'Shoes & Footwear 👟',
  ];

  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ReorderableListView")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReorderableListView.builder(
          itemBuilder: (context, index) {
            final product = _shoppingItems[index];
            return ListTile(
              key: ValueKey(product),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(product[0]),
              ),
              title: Text(product),
              subtitle: Text("Drag to reorder"),
              trailing: Icon(Icons.drag_handle),
            );
          },
          itemCount: _shoppingItems.length,
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final String MoveItem = _shoppingItems.removeAt(oldIndex);
              _shoppingItems.insert(newIndex, MoveItem);
              mysnk(
                "Moved $MoveItem from ${oldIndex + 1} → ${newIndex + 1}",
                context,
              );
            });
          },
        ),
      ),
    );
  }
}

//,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
//Practice Task 6.41 — ReorderableListView Ans Submit:Gmini
class SongReorderE extends StatefulWidget {
  const SongReorderE({super.key});

  @override
  State<SongReorderE> createState() => _SongReorderEState();
}

class _SongReorderEState extends State<SongReorderE> {
  final List<Map<String, String>> _musicPlaylist = [
    {'title': 'Hotel California', 'artist': 'Eagles'},
    {'title': 'Bohemian Rhapsody', 'artist': 'Queen'},
    {'title': 'Stairway to Heaven', 'artist': 'Led Zeppelin'},
    {'title': 'Smells Like Teen Spirit', 'artist': 'Nirvana'},
    {'title': 'Billie Jean', 'artist': 'Michael Jackson'},
    {'title': 'Imagine', 'artist': 'John Lennon'},
    {'title': 'Like a Rolling Stone', 'artist': 'Bob Dylan'},
    {'title': 'Wonderwall', 'artist': 'Oasis'},
  ];

  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music Playlist')),
      body: Padding(
          padding: EdgeInsets.all(8.0),
        child: ReorderableListView.builder(
            itemBuilder: (context, index){
              final song = _musicPlaylist[index];
              return ListTile(
                key: ValueKey(song['title']),
                leading: Icon(Icons.music_note),
                title: Text(song['title']!),
                subtitle: Text(song['artist']!),
                trailing: Icon(Icons.play_arrow),
              );

            },
            itemCount: _musicPlaylist.length,
            onReorder: (int oldIndex, int newIndex){
              setState(() {
                if(newIndex > oldIndex){
                  newIndex -= 1;
                }
                final Map<String, String> songMoved = _musicPlaylist.removeAt(oldIndex);
                _musicPlaylist.insert(newIndex, songMoved);
                mysnk("${songMoved["title"]} moved to position ${newIndex+1}", context);
              });

              
            },
        ),
      ),
    );
  }
}

//,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

class ReorderableDemo extends StatelessWidget {
  const ReorderableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingListScreen(),
    );
  }
}

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // ১. আমাদের মূল ডেটা লিস্ট
  final List<String> _shoppingItems = [
    'Apples 🍎',
    'Milk 🥛',
    'Bread 🍞',
    'Eggs 🥚',
    'Cheese 🧀',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: ReorderableListView(
        // ২. প্রতিটি আইটেম দেখতে কেমন হবে তা এখানে তৈরি হয়
        children: _shoppingItems
            .map(
              (item) => ListTile(
                // Key খুবই জরুরি। Flutter এটি ব্যবহার করে প্রতিটি আইটেমকে আলাদাভাবে চেনে।
                key: ValueKey(item),
                title: Text(item),
                trailing: const Icon(Icons.drag_handle),
              ),
            )
            .toList(),

        // ৩. onReorder ফাংশন - আসল কাজ এখানেই হয়
        onReorder: (int oldIndex, int newIndex) {
          // setState কল করা হয় UI আপডেট করার জন্য
          setState(() {
            // ৪. এই লজিকটি লিস্ট আপডেট করার জন্য খুবই গুরুত্বপূর্ণ

            // যদি আইটেমটিকে নিচের দিকে সরানো হয়, newIndex এক বেড়ে যায়।
            // তাই আমাদের এটিকে ঠিক করতে হবে।
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            // ৫. লিস্ট থেকে পুরনো পজিশনের আইটেমটি সরানো হচ্ছে
            final String item = _shoppingItems.removeAt(oldIndex);

            // ৬. এবং নতুন পজিশনে আইটেমটিকে যোগ করা হচ্ছে
            _shoppingItems.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
