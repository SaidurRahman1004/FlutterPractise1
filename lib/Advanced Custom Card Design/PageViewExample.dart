import 'package:flutter/material.dart'; // Flutter এর Material Design উইজেটগুলি ইম্পোর্ট করে।
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // পেজ ইন্ডিকেটরের জন্য একটি থার্ড-পার্টি প্যাকেজ ইম্পোর্ট করে।


//Practice Task 6.34 — PageView (Swipeable Pages) Ans:

class PageViewSwipe extends StatefulWidget {
   const PageViewSwipe({super.key});

  @override
  State<PageViewSwipe> createState() => _PageViewSwipeState();
}

class _PageViewSwipeState extends State<PageViewSwipe> {
  final PageController _pageController = PageController( initialPage: 0);
  int _currentPage = 0;


  mysnk(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView Swipe"),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (index){
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Container(
                  color: Colors.teal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "This is Page 1",
                        style: TextStyle(fontSize: 30,
                            color: Colors.white), // টেক্সটের স্টাইল সেট করে।
                      ),
                      Text(
                        "This is Page  ${_currentPage+1}",
                        style: TextStyle(fontSize: 15,
                            color: Colors.white), // টেক্সটের স্টাইল সেট করে।
                      ),

            
                    ],
            
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "This is Page 2",
                        style: TextStyle(fontSize: 30,
                            color: Colors.white), // টেক্সটের স্টাইল সেট করে।
                      ),
                      Text(
                        "This is Page ${_currentPage+1}",
                        style: TextStyle(fontSize: 15,
                            color: Colors.white), // টেক্সটের স্টাইল সেট করে।
                      ),

            
                    ],
            
                  ),
                ),
                Container(
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "This is Page 3",
                        style: TextStyle(fontSize: 30,
                            color: Colors.white), // টেক্সটের স্টাইল সেট করে।
                      ),
                      Text(
                        "This is ${_currentPage+1}",
                        style: TextStyle(fontSize: 15,
                            color: Colors.white), // টেক্সটের স্টাইল সেট করে।
                      ),
                      ElevatedButton(onPressed: (){mysnk("Welcome to the App", context);
                      }, child: Text("Get Started")),
            
                    ],
            
                  ),
                ),
              ],
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index)=>Container(
              margin: EdgeInsets.all(4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.blue : Colors.grey,

              ),
            )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){_pageController.previousPage(duration: Duration(microseconds: 300), curve: Curves.easeIn );}, icon: Icon(Icons.arrow_back)),
              IconButton(onPressed: (){
                _pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.easeIn );
              }, icon: Icon(Icons.arrow_forward)),
            ],
          ),

        ],
      ),

    );
  }
}



// pageView1 একটি StatelessWidget যা MaterialApp রিটার্ন করে।
class pageView1 extends StatelessWidget {
  const pageView1({super.key}); // কনস্ট্রাক্টর

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // অ্যাপ্লিকেশনের মূল কাঠামো তৈরি করে।
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানারটি সরিয়ে দেয়।
      home: OnboardingScreen(), // অ্যাপ্লিকেশনের হোম স্ক্রিন হিসেবে OnboardingScreen সেট করে।
    );
  }
}

// OnboardingScreen একটি StatefulWidget যা অনবোর্ডিং পেজগুলো দেখায়।
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key}); // কনস্ট্রাক্টর

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState(); // State অবজেক্ট তৈরি করে।
}

// _OnboardingScreenState OnboardingScreen এর State পরিচালনা করে।
class _OnboardingScreenState extends State<OnboardingScreen> {
  // PageView কন্ট্রোল করার জন্য একটি PageController তৈরি করা হয়েছে।
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( // একটি মৌলিক Material Design ভিজ্যুয়াল লেআউট কাঠামো প্রদান করে।
      appBar: AppBar( // অ্যাপ্লিকেশনের অ্যাপবার।
        title: const Text('PageView Demo'), // অ্যাপবারের টাইটেল।
        backgroundColor: Colors.deepPurple, // অ্যাপবারের পটভূমির রঙ।
      ),
      body: Stack( // উইজেটগুলিকে একে অপরের উপরে স্তরবিন্যাস করতে ব্যবহৃত হয়।
        children: [
          // আমাদের সব পেজগুলো এখানে থাকবে।
          PageView( // একটি স্ক্রোলযোগ্য তালিকা যা পৃষ্ঠা অনুসারে কাজ করে।
            controller: _controller,
            // PageView নিয়ন্ত্রণ করতে ব্যবহৃত PageController।
            scrollDirection: Axis.vertical,
            children: const [
              // পেজ ১
              OnboardingPage( // কাস্টম উইজেট যা একটি অনবোর্ডিং পেজ দেখায়।
                color: Colors.pinkAccent, // পেজের পটভূমির রঙ।
                icon: Icons.favorite, // পেজে প্রদর্শিত আইকন।
                title: 'Welcome to MyApp', // পেজের শিরোনাম।
                description: 'Discover amazing features that will make your life easier.', // পেজের বর্ণনা।
              ),
              // পেজ ২
              OnboardingPage(
                color: Colors.amber,
                icon: Icons.search,
                title: 'Find What You Need',
                description: 'Our powerful search helps you find anything in seconds.',
              ),
              // পেজ ৩
              OnboardingPage(
                color: Colors.lightBlue,
                icon: Icons.settings,
                title: 'Customize Everything',
                description: 'Personalize your experience with our advanced settings.',
              ),
            ],
          ),

          // পেজ ইন্ডিকেটর
          Container( // একটি কন্টেইনার উইজেট যা পেজ ইন্ডিকেটরকে অবস্থান করতে সাহায্য করে।
            alignment: const Alignment(0, 0.85),
            // স্ক্রিনের নিচের দিকে দেখানোর জন্য অ্যালাইনমেন্ট।
            child: SmoothPageIndicator( // একটি অ্যানিমেটেড পেজ ইন্ডিকেটর।
              controller: _controller,
              // PageView এর সাথে ইন্ডিকেটর সিঙ্ক্রোনাইজ করার জন্য PageController।
              count: 3,
              // মোট পেজের সংখ্যা।
              effect: const WormEffect( // ইন্ডিকেটরের ভিজ্যুয়াল ইফেক্ট।
                dotColor: Colors.white, // নিষ্ক্রিয় ডটের রঙ।
                activeDotColor: Colors.deepPurple, // সক্রিয় ডটের রঙ।
                dotHeight: 12, // প্রতিটি ডটের উচ্চতা।
                dotWidth: 12, // প্রতিটি ডটের প্রস্থ।
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// প্রতিটি পেজকে সুন্দরভাবে দেখানোর জন্য একটি কাস্টম উইজেট।
class OnboardingPage extends StatelessWidget {
  final Color color; // পেজের পটভূমির রঙ।
  final IconData icon; // পেজে প্রদর্শিত আইকন।
  final String title; // পেজের শিরোনাম।
  final String description; // পেজের বর্ণনা।

  const OnboardingPage({ // কনস্ট্রাক্টর
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container( // একটি কন্টেইনার যা পেজের বিষয়বস্তু ধারণ করে।
      color: color, // পটভূমির রঙ সেট করে।
      child: Column( // উইজেটগুলিকে উল্লম্বভাবে সাজায়।
        mainAxisAlignment: MainAxisAlignment.center,
        // বিষয়বস্তুকে উল্লম্বভাবে কেন্দ্রে রাখে।
        children: [
          Icon(icon, size: 120, color: Colors.white),
          // আইকন প্রদর্শন করে।
          const SizedBox(height: 30),
          // উল্লম্বভাবে ৩০ পিক্সেল ফাঁকা স্থান তৈরি করে।
          Text( // শিরোনাম প্রদর্শন করে।
            title,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          // উল্লম্বভাবে ১৫ পিক্সেল ফাঁকা স্থান তৈরি করে।
          Padding( // টেক্সটের চারপাশে প্যাডিং যোগ করে।
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text( // বর্ণনা প্রদর্শন করে।
              description,
              textAlign: TextAlign.center, // টেক্সটকে কেন্দ্রে সারিবদ্ধ করে।
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/////////আনথের

/////////আনথের

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  // MyPageView একটি StatefulWidget, যার অর্থ এটি সময়ের সাথে পরিবর্তিত হতে পারে এমন ডেটা ধারণ করে।
  @override
  _MyPageViewState createState() =>
      _MyPageViewState(); // এই ক্লাসের জন্য একটি State অবজেক্ট তৈরি করে এবং রিটার্ন করে।
}

class _MyPageViewState extends State<MyPageView> {
  // MyPageView উইজেটের State পরিচালনা করে।
  final PageController _controller = PageController(
      initialPage: 0); // PageView নিয়ন্ত্রণ করার জন্য একটি PageController তৈরি করে, প্রথম পৃষ্ঠা (ইনডেক্স 0) ডিফল্টভাবে দেখানো হয়।
  int _currentPage = 0; // বর্তমান দৃশ্যমান পৃষ্ঠার ইনডেক্স ট্র্যাক করার জন্য একটি ভেরিয়েবল।

  final pages = [ // PageView তে প্রদর্শিত পৃষ্ঠাগুলির জন্য রঙের একটি তালিকা।
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    // উইজেট ট্রি তৈরি করার জন্য এই মেথডটি কল করা হয়।
    return Scaffold( // একটি মৌলিক Material Design ভিজ্যুয়াল লেআউট কাঠামো প্রদান করে।
      appBar: AppBar(title: Text("PageView Example")),
      // অ্যাপ্লিকেশনের অ্যাপবার, যার শিরোনাম "PageView Example"।
      body: Column( // উইজেটগুলিকে উল্লম্বভাবে সাজানোর জন্য একটি Column ব্যবহার করা হয়েছে।
        children: [
          Expanded( // অবশিষ্ট উল্লম্ব স্থান পূরণ করার জন্য PageView কে প্রসারিত করে।
            child: PageView
                .builder( // একটি PageView তৈরি করে যা প্রয়োজন অনুযায়ী পৃষ্ঠাগুলি তৈরি করে (lazy loading)।
              controller: _controller,
              // PageView নিয়ন্ত্রণ করতে পূর্বে তৈরি করা PageController ব্যবহার করে।
              onPageChanged: (
                  index) { // যখন পৃষ্ঠা পরিবর্তন হয় তখন এই ফাংশনটি কল করা হয়।
                setState(() { // UI আপডেট করার জন্য স্টেট পরিবর্তন করে।
                  _currentPage = index; // বর্তমান পৃষ্ঠার ইনডেক্স আপডেট করে।
                });
              },
              itemCount: pages.length,
              // PageView তে মোট পৃষ্ঠার সংখ্যা।
              itemBuilder: (context,
                  index) { // প্রতিটি পৃষ্ঠা তৈরি করার জন্য এই ফাংশনটি কল করা হয়।
                return Container( // প্রতিটি পৃষ্ঠার জন্য একটি কন্টেইনার।
                  color: pages[index],
                  // `pages` তালিকা থেকে রঙ নিয়ে কন্টেইনারের পটভূমির রঙ সেট করে।
                  child: Center( // কন্টেইনারের বিষয়বস্তুকে কেন্দ্রে রাখে।
                    child: Text( // পৃষ্ঠার নম্বর প্রদর্শন করে।
                      "Page ${index + 1}",
                      style: TextStyle(fontSize: 30,
                          color: Colors.white), // টেক্সটের স্টাইল সেট করে।
                    ),
                  ),
                );
              },
            ),
          ),
          Row( // পৃষ্ঠা নির্দেশক ডটগুলিকে অনুভূমিকভাবে সাজানোর জন্য একটি Row ব্যবহার করা হয়েছে।
            mainAxisAlignment: MainAxisAlignment.center,
            // ডটগুলিকে কেন্দ্রে রাখে।
            children: List
                .generate( // `pages` তালিকার দৈর্ঘ্যের সমান সংখ্যক ডট তৈরি করে।
              pages.length,
                  (index) =>
                  Container( // প্রতিটি ডটের জন্য একটি কন্টেইনার।
                    margin: EdgeInsets.all(4), // ডটের চারপাশে মার্জিন যোগ করে।
                    width: 10, // ডটের প্রস্থ।
                    height: 10, // ডটের উচ্চতা।
                    decoration: BoxDecoration( // ডটের আকৃতি এবং রঙ নির্ধারণ করে।
                      shape: BoxShape.circle, // ডটটিকে বৃত্তাকার করে।
                      color: _currentPage == index ? Colors.black : Colors
                          .grey, // বর্তমান পৃষ্ঠা সক্রিয় থাকলে কালো, অন্যথায় ধূসর রঙ দেখায়।
                    ),
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( // একটি ভাসমান অ্যাকশন বোতাম তৈরি করে।
        onPressed: () { // বোতামটি চাপলে এই ফাংশনটি কল করা হয়।
          if (_currentPage <
              pages.length - 1) { // যদি বর্তমান পৃষ্ঠা শেষ পৃষ্ঠা না হয়।
            _controller
                .nextPage( // PageController ব্যবহার করে পরবর্তী পৃষ্ঠায় অ্যানিমেট করে।
              duration: Duration(milliseconds: 300), // অ্যানিমেশনের সময়কাল।
              curve: Curves.easeInOut, // অ্যানিমেশনের কার্ভ।
            );
          }
        },
        child: Icon(Icons
            .navigate_next), // বোতামে একটি "পরবর্তী নেভিগেট" আইকন প্রদর্শন করে।
      ),
    );
  }
}