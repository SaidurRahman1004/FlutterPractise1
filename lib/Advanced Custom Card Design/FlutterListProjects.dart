import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageControl extends StatelessWidget {
  const PageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Project Controller Using Button"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 500,
                  width: 500,
                  color: Colors.blue,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LisTpro()));
                        }, child: Text("ListTileAdvanCus")),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsListWithSwitch()));
                        }, child: Text("SettingsListWithSwitch")),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskListWithCheckbox()));
                        }, child: Text("Chk")),

                        
                      ],
                                  
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///Practice Task 6.30: ListTile + Switch/Checkbox & Custom Trailing Ans:
class SwitChkbx extends StatefulWidget {
   SwitChkbx({super.key});

  @override
  State<SwitChkbx> createState() => _SwitChkbxState();
}

class _SwitChkbxState extends State<SwitChkbx> {
  var ContactsList = ["Siyam Devo","HiruDon","Padraj Arafat","Hot Xahid 2 2",];
  List<bool> isActive = [true, false, true, false];
  Map<String, int> ActiveInactiveCount() {
    int activeCount = isActive.where((status)=>status).length;
    int inactiveCount = isActive.length - activeCount;
    return { "Active": activeCount, "Inactive": inactiveCount };

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: Colors.greenAccent,
        actions: [
          TextButton(onPressed: (){
            setState(() {
              bool allseLect = isActive.every((t)=>t);
              isActive = List<bool>.filled(isActive.length, !allseLect);

            });
          }, child: Text("Activate All / Deactivate All",style: TextStyle(color: Colors.white),)),
        ],
      ),
      body: ListView.builder(
        itemCount: ContactsList.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: CircleAvatar(
                radius: MediaQuery.of(context).size.width*0.05,
                child: Text(ContactsList[index][0]),
                backgroundColor: Colors.blue,
              ),
              title: Text( ContactsList[index],
                style: TextStyle(
                  color: isActive[index]? Colors.black : Colors.grey,

                ),
              ),
              trailing: Switch(
                  value: isActive[index], onChanged: (value){
                    setState(() {
                      isActive[index] = value;
                    });
              }
              ),
                onLongPress: (){
                  setState(() {
                    ActiveInactiveCount();
                  });

                }

            );

          }
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        color: Colors.blueGrey,
        child: Text("Active: ${ActiveInactiveCount()["Active"]}, Inactive: ${ActiveInactiveCount()["Inactive"]}",style:TextStyle(
          color: Colors.white,
          fontSize: 18,
            fontWeight: FontWeight.bold) ,textAlign: TextAlign.center,),



      ),

    );
  }
}






///swich toggle ai Copyedddddddd
class LisTpro extends StatelessWidget {
   LisTpro({super.key});

  var mycardItem = [
    {"img": "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png", "profileName": "Siyam Devo","post": "If you want to get respect, you have to give respect. So I will try to give you respect from my place"},
    {"img": "https://i.postimg.cc/tJnDcHjL/received-1211965183511363.jpg", "profileName": "Hiru r Pola Natok rasel","post": "Naitokk"},
    {"img": "https://i.postimg.cc/Xvx2G8LD/received-1010764821237896.jpg", "profileName": "HiruDon","post": "Firee..."},
    {"img": "https://i.postimg.cc/wB9fjPXm/received-1192891685907628.png", "profileName": "Padraj Arafat","post": "paddd Dilaaaam..."},
    {"img": "https://i.postimg.cc/vBN3XZpr/received-682209511020550.jpg", "profileName": "Hot Xahid 2 2","post": "Dreammmm."},
    {"img": "https://i.postimg.cc/L8tQRR1S/received-990889806002858.jpg", "profileName": "Dudu Hujur","post": "Dekmuna"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Chris Brown","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Olivia Jones","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "James Garcia","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Sophia Rodriguez","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Daniel Martinez","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Ava Hernandez","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Matthew Lopez","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Mia Gonzalez","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "profileName": "Andrew Perez","post": "ghexexgegh ehidehx oxoejx oxkelnx dxjlikd xj idexjidjnxj."},
  ];
  SnnkB(masg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(masg)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.builder(
          itemCount: mycardItem.length,
          itemBuilder: (context,index){
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
              elevation: 10,
              child: ListTile(
                contentPadding: EdgeInsets.all(10) ,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(mycardItem[index]["img"]!),
                  radius: MediaQuery.of(context).size.width*0.05,
                ),
                title: Text(mycardItem[index]["profileName"]!),
                //Text উইজেটের মধ্যে, maxLines প্রপার্টি সেট করুন যাতে টেক্সটটি কত লাইন পর্যন্ত দেখানো হবে তা নির্দিষ্ট করা যায়। এরপর, overflow প্রপার্টিতে TextOverflow.ellipsis সেট করুন। এর ফলে, যদি টেক্সট নির্দিষ্ট maxLines অতিক্রম করে, তাহলে শেষে "..." (ellipsis) দেখানো হবে।
                subtitle: Text("${mycardItem[index]["post"]!} \n 6:00 pm",
                  maxLines: 1,   /// উদাহরণস্বরূপ, সর্বোচ্চ ৩ লাইন দেখানো হবে
                  overflow: TextOverflow.ellipsis, // অতিরিক্ত টেক্সট থাকলে ... দেখানো হবে
                ),
                trailing: IconButton(onPressed: (){
                  SnnkB("Calling ${mycardItem[index]["profileName"]!}", context);
                }, icon: Icon(Icons.call)),
                onTap: (){
                  SnnkB(mycardItem[index]["profileName"]!, context);
                },
              ),

            );

      }
      ),

    );
  }
}

///Practice Task 6.31: ListTile + Switch/Checkbox & Custom Trailing (Stateful Interaction)


class SettingsListWithSwitch extends StatefulWidget {
  @override
  State<SettingsListWithSwitch> createState() => _SettingsListWithSwitchState();
}

class _SettingsListWithSwitchState extends State<SettingsListWithSwitch> {
  // প্রত্যেক setting এর স্টেট আলাদা রাখার জন্য list
  List<bool> switchStates = [false, true, false];

  final List<String> settingTitles = [
    "Notifications",
    "Dark Mode",
    "Location Access"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView.builder(
        itemCount: settingTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.settings),
            title: Text(settingTitles[index]),
            trailing: Switch(
              value: switchStates[index],
              onChanged: (bool value) {
                setState(() {
                  switchStates[index] = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}



//chkbox

class TaskListWithCheckbox extends StatefulWidget {                         // একটি StatefulWidget তৈরি করা হয়েছে, যাতে state পরিবর্তন হলে UI আপডেট হয়
  @override
  State<TaskListWithCheckbox> createState() => _TaskListWithCheckboxState(); // এর জন্য State ক্লাস তৈরি করা হচ্ছে
}

class _TaskListWithCheckboxState extends State<TaskListWithCheckbox> {
  List<bool> taskCompleted = [false, false, true];                          // প্রতিটি টাস্ক সম্পন্ন হয়েছে কিনা তার জন্য boolean লিস্ট
  final List<String> tasks = ["Buy Milk", "Call Mom", "Study Flutter"];     // টাস্কের নামের লিস্ট

  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                         // মূল UI স্ট্রাকচার (AppBar + Body)
      appBar: AppBar(
        title: Text("My Tasks"),                                             // AppBar এ শিরোনাম
        backgroundColor: Colors.pinkAccent,
        actions: [                                                           // AppBar এর ডান পাশে Action বাটন
          TextButton(
            onPressed: () {                                                  // বাটন প্রেস করলে Toggle All হবে
              setState(() {
                bool allSelected = taskCompleted.every((t) => t);            // সবগুলো টাস্ক true কিনা চেক করা হচ্ছে
                taskCompleted = List<bool>.filled(taskCompleted.length, !allSelected); // সবগুলোকে বিপরীত মান সেট করা হচ্ছে
              });
            },
            child: Text(
              "Toggle All",                                                  // বাটনের টেক্সট
              style: TextStyle(color: Colors.white),                         // সাদা রঙের টেক্সট
            ),
          )
        ],
      ),
      body: ListView.builder(                                                // টাস্ক লিস্ট দেখানোর জন্য ListView.builder ব্যবহার
        itemCount: tasks.length,                                             // লিস্টের আইটেম সংখ্যা
        itemBuilder: (context, index) {
          return ListTile(                                                    // প্রতিটি লিস্ট আইটেম
            leading: Icon(Icons.task_alt),                                    // বামের দিকে টাস্ক আইকন
            title: Text(tasks[index]),                                        // টাস্কের নাম
            trailing: Row(                                                    // ডান দিকে চেকবক্স ও মেনু
              mainAxisSize: MainAxisSize.min,                                 // রো যেন প্রয়োজন অনুযায়ী সাইজ নেয়
              children: [
                Checkbox(                                                     // চেকবক্স
                  value: taskCompleted[index],                                // বর্তমান টাস্ক completed কিনা দেখাচ্ছে
                  onChanged: (bool? value) {                                  // চেকবক্স ক্লিক করলে মান পরিবর্তন
                    setState(() {
                      taskCompleted[index] = value ?? false;                  // null হলে false সেট হবে
                    });
                  },
                ),
                PopupMenuButton<String>(                                      // পপআপ মেনু (তিন ডট বাটন)
                  onSelected: (value) {                                       // মেনু থেকে আইটেম সিলেক্ট হলে
                    ScaffoldMessenger.of(context).showSnackBar(               // স্ক্রিনে বার্তা দেখানো
                      SnackBar(content: Text("$value for ${tasks[index]}")),  // কোন অ্যাকশন কোন টাস্কে হয়েছে তা দেখায়
                    );
                  },
                  itemBuilder: (context) => [                                 // মেনুতে কোন কোন আইটেম থাকবে
                    PopupMenuItem(value: "Edit", child: Text("Edit")),        // Edit অপশন
                    PopupMenuItem(value: "Delete", child: Text("Delete")),    // Delete অপশন
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}



