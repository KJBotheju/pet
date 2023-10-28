import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../widgets/constant.dart';

class Pet {
  String name;
  String image;
  int age;
  String breed;

  Pet({
    required this.name,
    required this.image,
    required this.age,
    required this.breed,
  });
}

class PetProfilePage extends StatefulWidget {
  @override
  _PetProfilePageState createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage> {
  List<Pet> pets = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Profile'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          Pet pet = pets[index];
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.0),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: FileImage(File(pet.image)),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Name: ${pet.name}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Age: ${pet.age}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Breed: ${pet.breed}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _updatePetDetails(pet, index);
                        },
                        child: Text('Update'),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          _deletePet(index);
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addPetDetails();
        },
      ),
    );
  }

  void _addPetDetails() async {
    nameController.text = '';
    ageController.text = '';
    breedController.text = '';
    _image = null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Pet Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildImagePicker(),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Age',
                  ),
                ),
                TextField(
                  controller: breedController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Breed',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                final newPet = Pet(
                  name: nameController.text,
                  image: _image != null ? _image!.path : '',
                  age: int.parse(ageController.text),
                  breed: breedController.text,
                );

                // Send a POST request to Firebase to add the new pet data
                _addPetToFirebase(newPet);

                // Add the new pet to the local list
                setState(() {
                  pets.add(newPet);
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _updatePetDetails(Pet pet, int index) {
    TextEditingController nameEditController =
        TextEditingController(text: pet.name);
    TextEditingController ageEditController =
        TextEditingController(text: pet.age.toString());
    TextEditingController breedEditController =
        TextEditingController(text: pet.breed);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Pet Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildImagePicker(),
                TextField(
                  controller: nameEditController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: ageEditController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Age',
                  ),
                ),
                TextField(
                  controller: breedEditController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Breed',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Update'),
              onPressed: () {
                setState(() {
                  pet.name = nameEditController.text;
                  pet.age = int.parse(ageEditController.text);
                  pet.image = _image != null ? _image!.path : pet.image;
                  pet.breed = breedEditController.text;
                });

                // Send a PUT request to Firebase to update the pet data
                _updatePetInFirebase(pet);

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _deletePet(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Pet'),
          content: Text('Are you sure you want to delete this pet?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                final pet = pets[index];

                // Send a DELETE request to Firebase to remove the pet data
                _deletePetFromFirebase(pet);

                setState(() {
                  pets.removeAt(index);
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildImagePicker() {
    return Column(
      children: [
        _image != null
            ? CircleAvatar(
                backgroundImage: FileImage(_image!),
                radius: 50,
              )
            : Placeholder(
                fallbackHeight: 1,
                fallbackWidth: 1,
              ),
        ElevatedButton(
          onPressed: () {
            _pickImage();
          },
          child: Text('Pick an Image'),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  Future<void> _addPetToFirebase(Pet newPet) async {
    final firebaseDatabaseURL =
        'https://petcare-e6024-default-rtdb.asia-southeast1.firebasedatabase.app/';

    try {
      final response = await http.put(
        Uri.parse(
            '$firebaseDatabaseURL/pets/${newPet.hashCode}.json'), // You can set your custom key here
        body: json.encode({
          'name': newPet.name,
          'image': newPet.image,
          'age': newPet.age,
          'breed': newPet.breed,
        }),
      );

      if (response.statusCode == 200) {
        print('Pet details added to Firebase successfully.');
      } else {
        print('Failed to add pet details to Firebase');
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error adding pet details to Firebase: $error');
    }
  }

  Future<void> _updatePetInFirebase(Pet pet) async {
    final firebaseDatabaseURL =
        'https://petcare-e6024-default-rtdb.asia-southeast1.firebasedatabase.app/';

    try {
      final response = await http.patch(
        Uri.parse('$firebaseDatabaseURL/pets/${pet.hashCode}.json'),
        body: json.encode({
          'name': pet.name,
          'image': pet.image,
          'age': pet.age,
          'breed': pet.breed,
        }),
      );

      if (response.statusCode == 200) {
        print('Pet details updated in Firebase successfully.');
      } else {
        print('Failed to update pet details in Firebase');
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error updating pet details in Firebase: $error');
    }
  }

  Future<void> _deletePetFromFirebase(Pet pet) async {
    final firebaseDatabaseURL =
        'https://petcare-e6024-default-rtdb.asia-southeast1.firebasedatabase.app/';

    try {
      final response = await http.delete(
        Uri.parse('$firebaseDatabaseURL/pets/${pet.hashCode}.json'),
      );

      if (response.statusCode == 200) {
        print('Pet details deleted from Firebase successfully.');
      } else {
        print('Failed to delete pet details from Firebase');
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (error) {
      print('Error deleting pet details from Firebase: $error');
    }
  }
}
