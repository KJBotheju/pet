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
      name: 'NU pet studio',
      description: 'Contact: 0704449500',
      profileLink: 'https://www.facebook.com/NuPetStudio/',
      messengerLink:
          'https://api.whatsapp.com/send?phone=%2B94704449500&data=ARCyU5UAEurlr1I87EbAGK79s0x43vrrRnUMGM_mJM5GY8i7qFyyk4cieknzBV-rFUvsr2jwoLLti_kgiAfHvA-JTdLFK1_vD6Noil3Ab-LUqMAfaqLRPWOiZY7FGGACgaTdfofPXGhbx3ebz6ZPhJc0og&source=FB_Page&app=facebook&entry_point=page_cta', // Replace with the Messenger link
      images: [
        'assets/photograpy/nupetstudio.jpg',
      ],
    ),
    Photographer(
      name: 'Pet Studio',
      description: 'Contact: 0771770290',
      profileLink:
          'https://web.facebook.com/people/Pet-Studio-Sri-Lanka/100064220884054/?mibextid=LQQJ4d',
      messengerLink:
          'https://api.whatsapp.com/send?phone=%2B94704449500&data=ARCyU5UAEurlr1I87EbAGK79s0x43vrrRnUMGM_mJM5GY8i7qFyyk4cieknzBV-rFUvsr2jwoLLti_kgiAfHvA-JTdLFK1_vD6Noil3Ab-LUqMAfaqLRPWOiZY7FGGACgaTdfofPXGhbx3ebz6ZPhJc0og&source=FB_Page&app=facebook&entry_point=page_cta', // Replace with the Messenger link
      images: [
        'assets/photograpy/pet_studio.jpeg',
      ],
    ),
    Photographer(
      name: 'Mobile Studio',
      description: 'Contact: 0771775698',
      profileLink:
          'https://www.facebook.com/MSPHOTOGRAPHYAND?mibextid=ZbWKwL', // Replace with the Facebook profile link
      messengerLink:
          'https://api.whatsapp.com/send?phone=%2B94704449500&data=ARCyU5UAEurlr1I87EbAGK79s0x43vrrRnUMGM_mJM5GY8i7qFyyk4cieknzBV-rFUvsr2jwoLLti_kgiAfHvA-JTdLFK1_vD6Noil3Ab-LUqMAfaqLRPWOiZY7FGGACgaTdfofPXGhbx3ebz6ZPhJc0og&source=FB_Page&app=facebook&entry_point=page_cta', // Replace with the Messenger link
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
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                icon: Icon(Icons.facebook),
                label: Text('View Profile'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _launchMessenger(
                      photographer.messengerLink); // Open Messenger link
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 2, 86, 154),
                ),
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
