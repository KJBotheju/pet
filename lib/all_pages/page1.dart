// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'api_service.dart';
import '../widgets/constant.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String? selectedDoctorId;
  DateTime selectedDate = DateTime.now();

  Future<void> bookAppointment() async {
    if (selectedDoctorId == null || selectedDate == null) {
      Fluttertoast.showToast(msg: 'Please select doctor and date');
      return;
    }

    final result =
        await APIService.bookAppointment(selectedDoctorId!, selectedDate);

    if (result['success']) {
      Fluttertoast.showToast(msg: result['message']);
      // Handle successful booking, e.g., navigate to confirmation screen
    } else {
      Fluttertoast.showToast(msg: result['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        title: Text('E-Channeling'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedDoctorId,
              hint: Text('Select Doctor'),
              onChanged: (newValue) {
                setState(() {
                  selectedDoctorId = newValue;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'doctor1', // Unique value for Doctor 1
                  child: Text('Doctor 1'),
                ),
                DropdownMenuItem(
                  value: 'doctor2', // Unique value for Doctor 2
                  child: Text('Doctor 2'),
                ),
                // Add more doctors as needed
              ],
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                );

                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              child: Text(selectedDate != null
                  ? 'Selected Date: ${selectedDate.toString()}'
                  : 'Select Date'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: bookAppointment,
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
