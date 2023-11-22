import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ad_infinitum/models/item.dart';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({Key? key}) : super(key: key);

  @override
  _ViewItemPageState createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  Future<List<Item>> fetchItems() async {
    // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
    var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // decode the response to JSON
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the JSON to Item object
    List<Item> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Item.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Item'),
      ),
      body: FutureBuilder(
        future: fetchItems(),
        builder: (context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Column(
                children: [
                  Text(
                    "No item data available.",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.value}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
