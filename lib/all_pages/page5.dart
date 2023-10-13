import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pet/widgets/constant.dart';

class page5 extends StatefulWidget {
  @override
  State<page5> createState() => _page5State();
}

class _page5State extends State<page5> {
  List<Photographer> photographers = [
    Photographer(
      name: 'Pet Photography.Lk',
      description: 'Capturing precious moments of your pets.',
      profileLink: 'https://web.facebook.com/profile.php?id=100087300854371',
      messengerLink:
          'messenger://user?user_id=12345', // Replace with the Messenger link
      images: [
        'assets/photograpy/photograpy0.jpg',
      ],
    ),
    Photographer(
      name: 'Global PET Photography',
      description: 'Creating memories with pets from around the world.',
      profileLink: 'https://web.facebook.com/profile.php?id=100069821091916',
      messengerLink:
          'messenger://user?user_id=67890', // Replace with the Messenger link
      images: [
        'assets/photograpy/photograpy4.jpg',
      ],
    ),
    Photographer(
      name: 'Another Photographer',
      description: 'Photography description here.',
      profileLink:
          'https://web.facebook.com/anotherprofile', // Replace with the Facebook profile link
      messengerLink:
          'messenger://user?user_id=54321', // Replace with the Messenger link
      images: [
        'assets/photograpy/photograpy2.jpg',
      ],
    ),
    // Add more photographers with their details
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        title: Text('Photography'),
      ),
      body: ListView.builder(
        itemCount: photographers.length,
        itemBuilder: (context, index) {
          return PhotographerCard(photographer: photographers[index]);
        },
      ),
    );
  }
}

class Photographer {
  final String name;
  final String description;
  final String profileLink;
  final String messengerLink; // New Messenger link
  final List<String> images;

  Photographer({
    required this.name,
    required this.description,
    required this.profileLink,
    required this.messengerLink,
    required this.images,
  });
}

class PhotographerCard extends StatelessWidget {
  final Photographer photographer;

  PhotographerCard({required this.photographer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(
            photographer.images[0], // Display the first image
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              photographer.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(photographer.description),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  launch(photographer.profileLink);
                },
                icon: Icon(Icons.facebook),
                label: Text('View Profile'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _launchMessenger(
                      photographer.messengerLink); // Open Messenger link
                },
                icon: Icon(Icons.messenger),
                label: Text('Connect with Me'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchMessenger(String messengerLink) async {
    final canLaunchMessenger = await canLaunch(messengerLink);

    if (canLaunchMessenger) {
      await launch(messengerLink);
    } else {
      print("Messenger cannot be launched.");
    }
  }
}
