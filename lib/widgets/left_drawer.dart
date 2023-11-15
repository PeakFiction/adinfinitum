import 'package:flutter/material.dart';
import 'package:ad_infinitum/screens/menu.dart';
import 'package:ad_infinitum/screens/itemForm.dart';
import 'package:ad_infinitum/screens/viewItem.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Text(
                  'Ad Infinitum',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Item'),
            // redirect to ItemFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('View Items'),
            // redirect to ViewItemPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewItemPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
