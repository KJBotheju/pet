import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pet/widgets/constant.dart';

class PetProfilePage extends StatefulWidget {
  @override
  _PetProfilePageState createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage> {
  List<Pet> pets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: kPrimaryColor,
        title: Text('Pet Profiles'),
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return _buildPetProfile(pets[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewPet();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildPetProfile(Pet pet) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: FileImage(File(pet.petImage)),
            ),
            SizedBox(height: 20.0),
            Text(
              'Pet Name: ${pet.petName}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Pet Age: ${pet.petAge}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _updatePet(pet);
              },
              child: Text('Update Pet Details'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _deletePet(pet);
              },
              child: Text('Delete Pet'),
            ),
          ],
        ),
      ),
    );
  }

  void _addNewPet() {
    setState(() {
      Pet newPet = Pet(
        petName: 'New Pet',
        petAge: '0',
        petImage: '', // Empty string initially
      );
      pets.add(newPet);
    });
  }

  void _updatePet(Pet pet) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        String updatedPetName = pet.petName;
        String updatedPetAge = pet.petAge;
        String updatedPetImage = pet.petImage;

        Future<void> _pickImage(ImageSource source) async {
          final pickedImage = await ImagePicker().getImage(source: source);

          if (pickedImage != null) {
            setState(() {
              updatedPetImage = pickedImage.path;
            });
          }
        }

        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: updatedPetImage.isNotEmpty
                    ? FileImage(File(updatedPetImage))
                    : null,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                child: Text('Choose Image'),
              ),
              SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  updatedPetName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Pet Name',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  updatedPetAge = value;
                },
                decoration: InputDecoration(
                  labelText: 'Pet Age',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pet.petName = updatedPetName;
                    pet.petAge = updatedPetAge;
                    pet.petImage = updatedPetImage;
                  });
                  Navigator.pop(context);
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deletePet(Pet pet) {
    setState(() {
      pets.remove(pet);
    });
  }
}

class Pet {
  String petName;
  String petAge;
  String petImage;

  Pet({
    required this.petName,
    required this.petAge,
    required this.petImage,
  });
}
