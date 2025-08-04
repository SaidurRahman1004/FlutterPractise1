
///Step 6.18 Practice Task Ans Flutter Drawer Navigation (Side Menu)
import 'package:flutter/material.dart';
class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  snkbtn(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://i.postimg.cc/bNZdjVSY/o1.jpg"),
                ),
                Text("Saidur Rahman"),
                Text("SaidurRahman@hjjhj.com"),
              ],
            ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.pop(context);
                snkbtn("Home clicked", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){
                Navigator.pop(context);
                snkbtn("Settings clicked", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text("Logout"),
              onTap: (){
                Navigator.pop(context);
                snkbtn("Logout clicked", context);
              },
            ),
          ],
        ),
      ),

    );
  }
}

///📦🧪 Practice Task 6.19: Ans Drawer Navigation with Page Routing
class DrawerWithRoute extends StatelessWidget {
  const DrawerWithRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer With Route"),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            DrawerHeader(
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.postimg.cc/bNZdjVSY/o1.jpg"),
                ),
                accountName: Text("Saidur Rahman"),
                accountEmail: Text("Sai@hjjks"),
            ),
            ),
            ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },

            ),
            ListTile(
              title: Text("About Page"),
              leading: Icon(Icons.info),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
              },
            ),
            ListTile(
              title: Text("Settings Page"),
              leading: Icon(Icons.settings),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
              },
            )
          ],
        ),

      ),

    );
  }
}

// ✅ Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(child: Text("This is the Home Page")),
    );
  }
}
// ✅ About Page
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Page")),
      body: Center(child: Text("This is the About Page")),
    );
  }
}

// ✅ Settings Page
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings Page")),
      body: Center(child: Text("This is the Settings Page")),
    );
  }
}