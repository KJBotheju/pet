import 'package:flutter/material.dart';
import '../widgets/constant.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String? selectedDoctorId;
  Doctor? selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        title: Text('Select Doctor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedDoctorId,
              hint: Text('Select Doctor'),
              onChanged: (newValue) {
                setState(() {
                  selectedDoctorId = newValue;
                  selectedDoctor = getDoctorById(newValue);
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'doctor1',
                  child: Text('Dr. Nihal Peeris'),
                ),
                DropdownMenuItem(
                  value: 'doctor2',
                  child: Text('Dr. Shamith Dilshan'),
                ),
                // Add more doctors as needed
              ],
            ),
            if (selectedDoctor != null)
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor Name:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      selectedDoctor!.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Specialization:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      selectedDoctor!.specialization,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Doctor Fee:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rs. ${selectedDoctor!.doctorFee.toString()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Appointment Fee:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'RS. ${selectedDoctor!.appointmentFee.toString()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Available Time Slots:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (var slot in selectedDoctor!.availableTimeSlots)
                      Text(
                        slot,
                        style: TextStyle(fontSize: 16),
                      ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Show a pop-up message when the button is clicked
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Appointment Confirmed'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Book Appointment'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Doctor getDoctorById(String? doctorId) {
    final doctor = doctors.firstWhere(
      (doctor) => doctor.id == doctorId,
      orElse: () => Doctor(
        id: '',
        name: 'Unknown Doctor',
        specialization: 'Unknown Specialization',
        doctorFee: 0.0,
        appointmentFee: 0.0,
        availableTimeSlots: [],
      ),
    );
    return doctor;
  }
}

class Doctor {
  final String id;
  final String name;
  final String specialization;
  final double doctorFee;
  final double appointmentFee;
  final List<String> availableTimeSlots;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.doctorFee,
    required this.appointmentFee,
    required this.availableTimeSlots,
  });
}

final List<Doctor> doctors = [
  Doctor(
    id: 'doctor1',
    name: 'Dr. Nihal Peeris',
    specialization: 'Family Medicine',
    doctorFee: 1000,
    appointmentFee: 250,
    availableTimeSlots: ['9:00 AM', '10:00 AM', '11:00 AM'],
  ),
  Doctor(
    id: 'doctor2',
    name: 'Dr. Shamith Dilshan',
    specialization: 'Emergency Medicine',
    doctorFee: 1200,
    appointmentFee: 300,
    availableTimeSlots: ['2:00 PM', '3:00 PM', '4:00 PM'],
  ),
  // Add more doctors as needed
];
