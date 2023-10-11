// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/constant.dart';

class page9 extends StatefulWidget {
  @override
  State<page9> createState() => _page9State();
}

class _page9State extends State<page9> {
  final List<String> galleryImages = [
    'assets/images/d1.jpg',
    'assets/images/d2.jpeg',
    'assets/images/d3.jpg',
    'assets/images/d4.jpg',
    'assets/images/d5.jpg',
    'assets/images/d6.jpg',
    // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Set container width to screen width
                child: Image.asset(
                  'assets/images/donation.jpeg', // Replace with your image asset path
                  fit: BoxFit
                      .cover, // Use BoxFit.cover to make the image cover the entire container
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Donation Program Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Our donation program is dedicated to providing food for homeless dogs in need. Your generous support can make a real difference in their lives. You can contribute either in the form of money or by providing food items.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Bank Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Bank Name: BOC Bank',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Branch: Kelaniya',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Account Name: Rakshitha',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Account Number: 86975236',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'How to Donate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '1. Transfer money directly to the provided bank account with the reference "Dog Donation".',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '2. You can also contact us at petcare@gmail.com for food donations and other inquiries.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Pet Gallery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust the number of columns as needed
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: galleryImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      galleryImages[index],
                      fit: BoxFit.cover,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
