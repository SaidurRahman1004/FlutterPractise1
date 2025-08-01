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

///বাটন ক্লিক করে টেক্সট চেইঞ্জ
/*
class StatefullWidgetAiAll extends StatefulWidget {
  const StatefullWidgetAiAll({super.key});

  @override
  State<StatefullWidgetAiAll> createState() => _StatefullWidgetAiAllState();
}

class _StatefullWidgetAiAllState extends State<StatefullWidgetAiAll> {
  String txt = "Its Wil be changed Just Click Button";
  String txtCng = "Yes Changed";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StatefullWidgetAiAll"),),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 210,
              width: 210,
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(txt),
                  ElevatedButton(onPressed: (){setState(() {txt = txtCng;});}, child: Text("Changed txt")),
                ],
              ),

            ),
          ],
        ),

      ),
    );
  }
}


 */

// ///Image  ক্লিক করে টেক্সট নাম চেইঞ্জ
/*

class StatefullWidgetAiAll extends StatefulWidget {
  const StatefullWidgetAiAll({super.key});

  @override
  State<StatefullWidgetAiAll> createState() => _StatefullWidgetAiAllState();
}

class _StatefullWidgetAiAllState extends State<StatefullWidgetAiAll> {
  String username1 = "Saidur Rahman";
  String defult = "Press Image to see Name";
  final String Imgurl = "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png";
  final String Imgurl2 = "https://i.postimg.cc/bNZdjVSY/o1.jpg";
  snkbar(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StatefullWidgetAiAll"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  defult = username1;

                });
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(Imgurl),fit: BoxFit.cover),
                ),

              ),
            ),
            SizedBox(height: 15),
            Text(defult, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),

            InkWell(
              onTap: (){
                setState(() {
                  defult = "Siyam";
                });
              },

              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: NetworkImage(Imgurl2),fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0,2)
                      )
                    ]
                ),


              ),
            )
          ],

        ),
      ),


    );

  }
}


 */





//.......................Extra Copued From Ai................

class StatefullWidgetAiAll extends StatefulWidget {
  const StatefullWidgetAiAll({super.key});

  @override
  State<StatefullWidgetAiAll> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<StatefullWidgetAiAll> {
  // 1. TextEditingController তৈরি করা
  final TextEditingController _nameController = TextEditingController();

  // 2. State ভ্যারিয়েবল, যা ব্যবহারকারীর নাম ধারণ করবে
  String _displayName = '';

  @override
  void dispose() {
    // 3. Controller-কে dispose করা জরুরি, নয়তো মেমোরি লিক হতে পারে
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Input")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 4. TextField এবং Controller-কে যুক্ত করা
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Name',
                hintText: 'e.g., Saidur Rahman',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 5. বাটন চাপলে Controller থেকে টেক্সট নিয়ে State আপডেট করা
                setState(() {
                  _displayName = _nameController.text;
                });
              },
              child: const Text('Show Name'),
            ),
            const SizedBox(height: 30),
            Text(
              'Hello, $_displayName', // 6. আপডেট হওয়া নাম এখানে দেখানো
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

//Another Extra

/*

// এটি একটি StatelessWidget, কারণ ফর্মের ডেটা এবং অবস্থা (state)
// সরাসরি এই ক্লাসে রাখা হয়নি।
class StatefullWidgetAiAll extends StatelessWidget {
  // ✅ _formKey: ফর্মের জন্য একটি ইউনিক চাবি বা শনাক্তকারী।
  // এর মাধ্যমে ফর্মের বর্তমান অবস্থা (state) নিয়ন্ত্রণ করা যায়।
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ✅ TextEditingController: নাম ইনপুট ফিল্ডের জন্য একটি রিমোট কন্ট্রোল।
  // এর মাধ্যমে ফিল্ডের লেখা পড়া বা পরিবর্তন করা যায়।
  final TextEditingController nameCtrl = TextEditingController();

  // ✅ TextEditingController: পাসওয়ার্ড ইনপুট ফিল্ডের জন্য আরেকটি রিমোট কন্ট্রোল।
  final TextEditingController passCtrl = TextEditingController();

  // এই ফাংশনটি বাটন ক্লিক করলে কল হবে।
  void submitData(BuildContext context) {
    // ফর্মের validate() মেথড কল করে সব validator চেক করা হচ্ছে।
    if (_formKey.currentState!.validate()) {
      // যদি সব ফিল্ডের ভ্যালিডেশন সঠিক হয়...

      // কন্ট্রোলার ব্যবহার করে নাম এবং পাসওয়ার্ডের লেখাগুলো পড়া হচ্ছে।
      String name = nameCtrl.text;
      String pass = passCtrl.text;

      // ✅ ScaffoldMessenger: স্ক্রিনের নিচে একটি মেসেজ (SnackBar) দেখানোর জন্য।
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Welcome $name! Login Successful ✅")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Form")),
      body: Padding(
        padding: EdgeInsets.all(20),
        // ✅ Form: একাধিক ইনপুট ফিল্ডকে একটি গ্রুপ হিসেবে ধরে রাখে।
        child: Form(
          key: _formKey, // ফর্মের সাথে চাবিটি যুক্ত করা হলো।
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 👉 Name Field
              TextFormField(
                controller: nameCtrl, // নাম ফিল্ডের সাথে তার কন্ট্রোলার যুক্ত করা হলো।
                decoration: InputDecoration(labelText: "Enter your name"),
                // ✅ validator: এই ফিল্ডের ইনপুট যাচাই করার নিয়ম।
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // যদি ফিল্ড খালি থাকে, তাহলে এই এরর মেসেজটি দেখানো হবে।
                    return 'Name cannot be empty';
                  }
                  return null; // যদি সব ঠিক থাকে, তাহলে null রিটার্ন করতে হবে।
                },
              ),
              SizedBox(height: 20),

              // 👉 Password Field
              TextFormField(
                controller: passCtrl, // পাসওয়ার্ড ফিল্ডের সাথে তার কন্ট্রোলার যুক্ত করা হলো।
                obscureText: true,    // ✅ obscureText: লেখার অক্ষরগুলোকে * চিহ্ন দিয়ে গোপন রাখে।
                decoration: InputDecoration(labelText: "Enter your password"),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    // যদি পাসওয়ার্ড ৬ অক্ষরের কম হয়, তাহলে এরর মেসেজ দেখানো হবে।
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // 👉 Submit Button
              ElevatedButton(
                // বাটন চাপলে submitData ফাংশনটি কল হবে।
                onPressed: () => submitData(context),
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

 */