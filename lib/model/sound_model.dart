import 'dart:convert';

class Sound {
  int? id;
  String? name;
  String? image;
  String? sound;

  Sound({
    this.name,
    this.image,
    this.sound,
  });

  factory Sound.fromJson(Map<String, dynamic> parsedJson) {
    return Sound(
        name: parsedJson['name'] as String,
        image: parsedJson['image'] as String,
        sound: parsedJson['sound'] as String);
  }
}
