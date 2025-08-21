import 'package:flutter/material.dart';



class practisePage extends StatefulWidget {
  const practisePage({super.key});

  @override
  State<practisePage> createState() => _practisePageState();
}

class _practisePageState extends State<practisePage> {
  String selectedDate = "No Date Selected";

  // 📆 Date Picker Function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // আজকের তারিখ ডিফল্ট
      firstDate: DateTime(2000),   // শুরু তারিখ
      lastDate: DateTime(2100),    // শেষ তারিখ
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate =
        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("DatePicker UI Design")),
        body: Center(
          child: Container(
            height: 200,
            width: 320,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 4))
              ],
            ),
            child: Stack(
              children: [
                // Text in Center
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    selectedDate,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),

                // Button at Bottom Center
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.calendar_month),
                    label: Text("Pick Date"),
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white),
                  ),
                ),

                // Positioned Label Top-Left
                Positioned(
                  top: 0,
                  left: 0,
                  child: Text(
                    "Date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



