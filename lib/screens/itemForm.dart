import 'package:flutter/material.dart';
import 'package:ad_infinitum/widgets/left_drawer.dart';
import 'package:ad_infinitum/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ad_infinitum/screens/menu.dart';
import 'dart:convert';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({Key? key});

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _value = 0;
  String _description = "";
  bool _is_new = true;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Item',
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _value = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Amount must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Send request to Django and wait for the response
                        // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/", // Adjust the URL endpoint
                          jsonEncode(<String, String>{
                            'name': _name,
                            'value': _value.toString(),
                            'description': _description,
                            'weight': _amount.toString(),
                            'is_new': _is_new.toString(),
                          }),
                        );

                        print("Response from server: $response");
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("New product has saved successfully!"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("Something went wrong, please try again."),
                          ));
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
