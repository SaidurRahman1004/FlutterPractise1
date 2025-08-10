import 'package:flutter/material.dart';
// Practice Task 6.27:Ans: Flutter Stack + Positioned – Profile Layout UI Design
class CustomProfileLayout extends StatelessWidget {
  const CustomProfileLayout({super.key});
  final coverImage = "https://i.postimg.cc/BQJ74d94/Cover-Pic-SRSiyam.png";
  final ProfileImage = "https://i.postimg.cc/bNZdjVSY/o1.jpg";
  snkbtn(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Profile Layout"),),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(coverImage),fit: BoxFit.cover),
                ),

              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: -50,
                child: Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: NetworkImage(ProfileImage),
                    ),
                  ),

                ),
              ),
            ],
          ),
          SizedBox(height: 60,),
          Text("Saidur R. Sheam",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,),
          Text("App Developer | DevOPS Engineer",style: TextStyle(fontSize: 14, color: Colors.grey[700]),),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){snkbtn("Followed", context);}, icon: Icon(Icons.follow_the_signs,color: Colors.blue,)),
              IconButton(onPressed: (){snkbtn("Massege Done", context);}, icon: Icon(Icons.message,color: Colors.redAccent,)),
              IconButton(onPressed: (){snkbtn("Call me", context);}, icon: Icon(Icons.call,color: Colors.blue,)),
            ],
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Vestibulum at sagittis elit, sed malesuada sapien. "
                  "Praesent porttitor augue nec turpis luctus varius.",textAlign: TextAlign.center,)

          )

        ],
      ),
    );
  }
}


//CopyedCollectedAi
/*
class ProfileLayoutResponsive extends StatelessWidget { // Stateless widget ডিক্লেয়ার
  const ProfileLayoutResponsive({super.key}); // Constructor (key নেয়ার জন্য)

  @override
  Widget build(BuildContext context) { // build method → UI তৈরির জায়গা
    return Scaffold( // Scaffold → main UI layout structure
      body: SingleChildScrollView( // ✅ স্ক্রল সাপোর্ট যাতে ছোট স্ক্রিনে overflow না হয়
        child: Column( // সব UI element vertically সাজানোর জন্য Column
          children: [ // Column এর ভিতরে widget লিস্ট
            Stack( // Stack → উপরে উপরে widget বসানোর জন্য
              clipBehavior: Clip.none, // ✅ overflow widget দেখানোর জন্য (profile pic cover-এর বাইরে যাবে)
              children: [
                // Cover Photo
                Container( // Cover photo রাখার container
                  height: 220, // Cover photo এর height
                  width: double.infinity, // পুরো স্ক্রিনের width নেবে
                  decoration: BoxDecoration( // Decoration → background image সেট করার জন্য
                    image: DecorationImage( // Background image সেট
                      image: NetworkImage( // ইন্টারনেট থেকে image লোড
                        "https://images.unsplash.com/photo-1503264116251-35a269479413", // cover photo URL
                      ),
                      fit: BoxFit.cover, // Image পুরো container cover করবে
                    ),
                  ),
                ),

                // Profile Picture
                Positioned( // Stack এর মধ্যে fixed position এ widget বসানোর জন্য
                  bottom: -50, // Cover photo থেকে ৫০ পিক্সেল নিচে নামানো
                  left: 0, // বাম দিক থেকে 0 → center করার জন্য right ও 0                          //right: 0,left: 0, দিয়ে stack এ কন্টেন্ত মাঝে নিয়ে আসার উপায়!
                  right: 0, // ডান দিক থেকে 0
                  child: CircleAvatar( // বাইরের সাদা বর্ডার সহ প্রোফাইল পিকচার container
                    radius: 50, // outer circle radius
                    backgroundColor: Colors.white, // outer circle color (সাদা)
                    child: CircleAvatar( // আসল প্রোফাইল পিকচার
                      radius: 46, // inner circle radius (border effect এর জন্য ছোট)
                      backgroundImage: NetworkImage( // প্রোফাইল ছবি লোড
                        "https://i.postimg.cc/bNZdjVSY/o1.jpg", // profile picture URL
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60), // ✅ Profile pic এর height gap তৈরি cover এর নিচে

            // Name
            Text(
              "Saidur Rahman", // নাম
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), // নামের style
            ),
            const SizedBox(height: 5), // নামের নিচে ফাঁকা

            // Bio
            Text(
              "Flutter Developer | Tech Enthusiast", // বায়ো
              style: TextStyle(fontSize: 14, color: Colors.grey[700]), // বায়োর style
            ),
            const SizedBox(height: 15), // বায়োর নিচে ফাঁকা

            // Social Buttons
            Row( // Row → horizontal alignment এর জন্য
              mainAxisAlignment: MainAxisAlignment.center, // সব icon center এ রাখা
              children: [
                IconButton( // Facebook icon
                  onPressed: () {}, // press করলে কিছু হবে না (empty function)
                  icon: Icon(Icons.facebook, color: Colors.blue), // icon + রঙ
                ),
                IconButton( // Camera icon
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt, color: Colors.purple),
                ),
                IconButton( // Mail icon
                  onPressed: () {},
                  icon: Icon(Icons.mail, color: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 30), // Social button এর নিচে ফাঁকা

            // Dummy content for scrolling
            Padding( // Text এর চারপাশে padding দেওয়ার জন্য
              padding: const EdgeInsets.symmetric(horizontal: 20), // দুই পাশে 20px ফাঁকা
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Vestibulum at sagittis elit, sed malesuada sapien. "
                    "Praesent porttitor augue nec turpis luctus varius.", // Demo টেক্সট
                textAlign: TextAlign.center, // টেক্সট center alignment
              ),
            ),
            const SizedBox(height: 200), // নিচে extra ফাঁকা জায়গা
          ],
        ),
      ),
    );
  }
}
*/
