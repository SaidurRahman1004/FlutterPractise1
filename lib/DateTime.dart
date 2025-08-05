


//Practice Task 6.21 Ans Flutter DatePicker + TimePicker Widget – Full Beginner to Pro Guide
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeCustom extends StatefulWidget {
  const DateTimeCustom({super.key});

  @override
  State<DateTimeCustom> createState() => _DateTimeCustomState();
}

class _DateTimeCustomState extends State<DateTimeCustom> {
//DAtePicker
  DateTime? selectedDate;
  //Function DAte Picker
  datepickerCustom() async {
    DateTime? pickeDate= await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2029),
    );
    if(pickeDate != null){
      setState(() {
        selectedDate = pickeDate;
      });
    }
  }

  //TimePicker
  TimeOfDay? selectedTime;
  //Function Time Picker
  timepickerCustom() async {
    TimeOfDay? pickedTime= await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );
    if(pickedTime != null){
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DateTime"),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 200,
                child: Card(
                  elevation: 80,
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      children: [
                        Text(selectedDate == null ? "Select Date" : "Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
                        SizedBox(height: 30,),

                        ElevatedButton(onPressed: (){datepickerCustom();}, child: Text("Date Picker")),
                      ],


                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: SizedBox(
                height: 100,
                width: 200,
                child: Card(
                  elevation: 80,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      children: [
                        //Text(selectedTime == null ? "Select Time" : "Selected Time: ${selectedTime!.hour}:${selectedTime!.minute} "),
                        Text(selectedTime == null ? "Select Time" : "Selected Time: ${selectedTime!.format(context)} "),
                        SizedBox(height: 20,),

                        ElevatedButton(onPressed: (){ timepickerCustom();}, child: Text("Time Picker")),
                      ],


                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


