import 'package:flutter/material.dart';
import 'package:ad_infinitum/widgets/left_drawer.dart';
import 'package:ad_infinitum/models/item.dart';
import 'package:flutter/cupertino.dart';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({super.key});

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
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
                      _price = int.parse(value!);
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Item.add(
                          Name: _name,
                          Price: _price,
                          Amount: _amount,
                          Description: _description,
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            if (Theme.of(context).platform ==
                                TargetPlatform.iOS) {
                              // Show CupertinoAlertDialog on iOS
                              return CupertinoAlertDialog(
                                title: const Text('Item Saved!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Price: $_price'),
                                      Text('Amount: $_amount'),
                                      Text('Description: $_description'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            } else {
                              // Show AlertDialog on other platforms
                              return AlertDialog(
                                title: const Text('Item Saved!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Price: $_price'),
                                      Text('Amount: $_amount'),
                                      Text('Description: $_description'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            }
                          },
                        );
                        _formKey.currentState!.reset();
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
