// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet/widgets/constant.dart';

class TeamMember {
  final String name;
  final String photo;

  TeamMember({
    required this.name,
    required this.photo,
  });
}

class AboutUs extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(
      name: 'Kavinda Botheju',
      photo: 'assets/images/dog1.jpg',
    ),
    TeamMember(
      name: 'Rakshitha Kulasara',
      photo: 'assets/images/dog2.jpg',
    ),
    TeamMember(
      name: 'Tharushi Udawatta',
      photo: 'assets/images/dog3.jpg',
    ),
    TeamMember(
      name: 'Malki Dilhara',
      photo: 'assets/images/dog4.jpg',
    ),
    TeamMember(
      name: 'Durandi Tharunya',
      photo: 'assets/images/dog5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('About Us'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(
                  'assets/images/dog0.jpg'), // Add your logo image path here
            ),
            SizedBox(height: 20.0),
            Text(
              'Pet Care',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We are computer science undergraduates at the University of Kelaniya, passionate about pets and technology. Our mission is to provide pet lovers with an innovative mobile application that enhances their experience in caring for and connecting with their beloved pets.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 100, 100, 100),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Email: petcare@gmail.com',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 120, 120, 120)),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: (teamMembers.length / 2).ceil(),
                itemBuilder: (BuildContext context, int rowIndex) {
                  int startingIndex = rowIndex * 2;
                  return Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundImage:
                                  AssetImage(teamMembers[startingIndex].photo),
                            ),
                            title: Text(teamMembers[startingIndex].name),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      if (startingIndex + 1 < teamMembers.length)
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25.0,
                                backgroundImage: AssetImage(
                                    teamMembers[startingIndex + 1].photo),
                              ),
                              title: Text(teamMembers[startingIndex + 1].name),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
