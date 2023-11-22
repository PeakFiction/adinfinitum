import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Model model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };

  // Updated add method
  static void add({
    required String name,
    required int value,
    required String description,
    required int weight,
    required int user,
    required bool isNew,
  }) {
    listItem.add(Item(
      model: Model
          .MAIN_PRODUCT, // You may need to adjust this based on your actual model
      pk: 0, // You may need to adjust this based on your actual model
      fields: Fields(
        name: name,
        value: value,
        description: description,
        weight: weight,
        user: user,
        isNew: isNew,
      ),
    ));
  }
}

class Fields {
  String name;
  int value;
  String description;
  int weight;
  int user;
  bool isNew;

  Fields({
    required this.name,
    required this.value,
    required this.description,
    required this.weight,
    required this.user,
    required this.isNew,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        value: json["value"],
        description: json["description"],
        weight: json["weight"],
        user: json["user"],
        isNew: json["is_new"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "description": description,
        "weight": weight,
        "user": user,
        "is_new": isNew,
      };
}

enum Model { MAIN_PRODUCT }

final modelValues = EnumValues({"main.product": Model.MAIN_PRODUCT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// Existing list of items
List<Item> listItem = [];
