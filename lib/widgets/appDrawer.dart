// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet/widgets/constant.dart';
import '../widgets/menuList.dart';
import '../screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

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
              'Kavinda',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              'kavinda@gmail.com',
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
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            title: 'GO GO',
            icon: Icons.dashboard,
          ),
          MenuList(
            press: () {},
            title: 'cart',
            icon: Icons.shopping_cart,
          ),
          MenuList(
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
            title: 'Log Out',
            icon: Icons.exit_to_app,
          ),
        ],
      ),
    );
  }
}
