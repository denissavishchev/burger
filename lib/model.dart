import 'package:flutter/material.dart';
import 'dart:convert';

class Burgers {
  final String name;
  final String image;
  final String hit;
  final String kcal;
  final String time;
  final String weight;

  const Burgers({
    required this.name,
    required this.image,
    required this.hit,
    required this.kcal,
    required this.time,
    required this.weight,
  });

  static Burgers fromJson(json) =>
      Burgers(
          name: json['name'],
          image: json['image'],
          hit: json['hit'],
          kcal: json['kcal'],
          time: json['time'],
          weight: json['weight']
      );

}

class BurgersApi {
  static Future<List<Burgers>> getBurgers(BuildContext context) async {
    final assetBungle = DefaultAssetBundle.of(context);
    final data = await assetBungle.loadString('assets/burgers.json');
    final body = jsonDecode(data);
    return body.map<Burgers>(Burgers.fromJson).toList();
  }
}
