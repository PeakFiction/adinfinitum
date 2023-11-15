import 'package:flutter/material.dart';
import 'package:ad_infinitum/screens/itemForm.dart';
import 'package:ad_infinitum/screens/viewItem.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;

  ShopItem(this.name, this.icon, this.backgroundColor, this.textColor);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // Set button color to white
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Item") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ItemFormPage(),
              ),
            );
          }

          if (item.name == "View Items") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewItemPage()),
            );
          }
        },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.black, // Set icon color to black
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.black), // Set text color to black
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
