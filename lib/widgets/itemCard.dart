import 'package:flutter/material.dart';
import 'package:ad_infinitum/screens/itemForm.dart';
import 'package:ad_infinitum/screens/viewItem.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ad_infinitum/screens/login.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: Colors.white, // Set button color to white
      child: InkWell(
        // Responsive touch area
        onTap: () async {
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
          } else if (item.name == "View Items") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewItemPage()),
            );
          } else if (item.name == "View Products") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewItemPage()),
            );
          } else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Good bye, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
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
