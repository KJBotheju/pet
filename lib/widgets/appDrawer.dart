// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet/widgets/constant.dart';
import '../widgets/menuList.dart';
import '../screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/aboutus_screen.dart';
import '../screens/petprofile_screen.dart';
import '../screens/neckbelt.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            accountName: Text(
              '',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              '',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/patcare.png',
              ),
            ),
          ),
          MenuList(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            title: 'Home',
            icon: Icons.home,
          ),
          MenuList(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ),
              );
            },
            title: 'About Us',
            icon: Icons.people,
          ),
          MenuList(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetProfilePage(),
                ),
              );
            },
            title: 'Pet Profile',
            icon: Icons.pets,
          ),
          MenuList(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NeckBeltPage(),
                ),
              );
            },
            title: 'Neck Belt Tracker',
            icon: Icons.track_changes_rounded,
          ),
          MenuList(
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
            title: 'Log Out',
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
