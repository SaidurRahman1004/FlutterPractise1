import 'package:flutter/material.dart';
//Practice Task 6.29 ঃ Flutter Stack + Positioned – Social Media Feed Post Layout ans:
/*
class SocialMediaPost extends StatelessWidget {
   SocialMediaPost({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Media Post"),
      ),
      body: ListView.builder(
        itemCount: mycardItem.length,
          itemBuilder:(context,index){
          return Card(
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(mycardItem[index]["img"]!),
                    radius: MediaQuery.of(context).size.width*0.05,
                  ),
                  title: Text(mycardItem[index]['profileName']!,style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04,),),
                  subtitle: Text("2 hours ago",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03,),),
                  trailing: Icon(Icons.more_vert,size: MediaQuery.of(context).size.width * 0.04 ,),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(MediaQuery.of(context).size.width * 0.02),
                  child: Text(mycardItem[index]['post']!,style: TextStyle( fontSize: MediaQuery.of(context).size.width * 0.035, ),),

                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(

                    children: [
                      Image.network(mycardItem[index]["img"]!,fit: BoxFit.cover,height: MediaQuery.of(context).size.height * 0.3,width: 250,),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            children: [
                              ElevatedButton.icon(onPressed: (){}, label: Icon(Icons.thumb_up), icon: Text("Like")),
                              SizedBox(width: 10,),
                              ElevatedButton.icon(onPressed: (){}, label: Icon(Icons.comment), icon: Text("Comment"))
                            ],

                          )
                      ),


                    ],
                  ),


                ),
///Replace HAre...

              ],
            ),
          );
          }
      )
    );
  }
}

 */




//Another
import 'package:flutter/material.dart';

class SocialMediaPost extends StatelessWidget {
  SocialMediaPost({super.key});

  var mycardItem = [
    {
      "img": "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png",
      "profileName": "Siyam Devo",
      "post": "If you want to get respect, you have to give respect."
    },
    {
      "img": "https://i.postimg.cc/tJnDcHjL/received-1211965183511363.jpg",
      "profileName": "Hiru r Pola Natok rasel",
      "post": "Naitokk"
    },
    {
      "img": "https://i.postimg.cc/mDxzTffY/0.jpg",
      "profileName": "Chris Brown",
      "post": "Random caption text..."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Social Media Post")),
      body: ListView.builder(
        itemCount: mycardItem.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Info
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    NetworkImage(mycardItem[index]["img"]!),
                    radius: MediaQuery.of(context).size.width * 0.05,
                  ),
                  title: Text(
                    mycardItem[index]['profileName']!,
                    style: TextStyle(
                      fontSize:
                      MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "2 hours ago",
                    style: TextStyle(
                        fontSize:
                        MediaQuery.of(context).size.width * 0.03),
                  ),
                  trailing: Icon(
                    Icons.more_vert,
                    size: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),

                // Caption
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.03),
                  child: Text(
                    mycardItem[index]['post']!,
                    style: TextStyle(
                        fontSize:
                        MediaQuery.of(context).size.width * 0.035),
                  ),
                ),

                // Post Image + Like/Comment
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.network(
                        mycardItem[index]["img"]!,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up),
                              label: Text("Like"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Colors.white.withOpacity(0.8)),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.comment),
                              label: Text("Comment"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Colors.white.withOpacity(0.8)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


