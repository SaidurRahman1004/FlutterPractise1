import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseAssignmentOstad extends StatelessWidget {
  const CourseAssignmentOstad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CourseCardUi());
  }
}

class CourseCardUi extends StatelessWidget {
  CourseCardUi({super.key});
//List
  final List coursesDetails = [
    {
      "image":
          "https://cdn.ostad.app/course/cover/2024-12-17T11-35-19.890Z-Course%20Thumbnail%2012.jpg",
      "title": "Full Stack Web Development with JavaScript (MERN)",
      "batch": "ব্যাচ ১৩",
      "seats": "৪ সিট বাকি",
      "days": "৭ দিন বাকি",
    },
    {
      "image":
          "https://cdn.ostad.app/course/cover/2024-12-19T15-48-52.487Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg",
      "title": "Full Stack Web Development with Python, Django & React",
      "batch": "ব্যাচ ৮",
      "seats": "৯৫ সিট বাকি",
      "days": "৩৫ দিন বাকি",
    },

    {
      "image":
          "https://cdn.ostad.app/course/photo/2024-12-18T15-29-34.261Z-Untitled-1%20(23).jpg",
      "title": "SQA: Manual & Automated Testing",
      "batch": "ব্যাচ ৯",
      "seats": "৪১ সিট বাকি",
      "days": "৯ দিন বাকি",
    },
    {
      "image":
          "https://cdn.ostad.app/course/cover/2024-12-18T15-24-44.114Z-Untitled-1%20(21).jpg",
      "title": "Full Stack Web Development with ASP.Net Core",
      "batch": "ব্যাচ ১৫",
      "seats": "৫ সিট বাকি",
      "days": "৮ দিন বাকি",
    },
  ];
//Courses Grid
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: coursesDetails.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              final course = coursesDetails[index];
              return CourseCardCustom(
                imageUrl: course["image"],
                title: course["title"],
                batch: course["batch"],
                seats: course["seats"],
                days: course["days"],
              );
            },
          ),
        ),
      ),
    );
  }
}

//CustomCourseCarrd Widgte
class CourseCardCustom extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String batch;
  final String seats;
  final String days;

  const CourseCardCustom({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.batch,
    required this.seats,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      custobBadge(batch),
                      SizedBox(width: 5),
                      custobBadge(seats,icon:Icons.groups),
                      SizedBox(width: 5),
                      custobBadge(days,icon: Icons.access_time),
                    ],
                  )),
              Divider(),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("বিস্তারিত দেখুন ➜"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
//batch,day,sit Row Widget Custom
  Widget custobBadge(String text,{IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          if(icon != null)...[
            Icon(icon,size: 14,),
            SizedBox(width: 4,)
          ],
          Text(text, style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
