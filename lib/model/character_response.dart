import 'wand.dart';

class CharacterResponse {
  String actor;
  bool alive;
  String ancestry;
  String dateOfBirth;
  String eyeColour;
  String gender;
  String hairColour;
  bool hogwartsStaff;
  bool hogwartsStudent;
  String house;
  String image;
  String name;
  String patronus;
  String species;
  Wand wand;
  String yearOfBirth;

  CharacterResponse(
      {this.actor,
      this.alive,
      this.ancestry,
      this.dateOfBirth,
      this.eyeColour,
      this.gender,
      this.hairColour,
      this.hogwartsStaff,
      this.hogwartsStudent,
      this.house,
      this.image,
      this.name,
      this.patronus,
      this.species,
      this.wand,
      this.yearOfBirth});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    return CharacterResponse(
      actor: json['actor'],
      alive: json['alive'],
      ancestry: json['ancestry'],
      dateOfBirth: json['dateOfBirth'],
      eyeColour: json['eyeColour'],
      gender: json['gender'],
      hairColour: json['hairColour'],
      hogwartsStaff: json['hogwartsStaff'],
      hogwartsStudent: json['hogwartsStudent'],
      house: json['house'],
      image: json['image'],
      name: json['name'],
      patronus: json['patronus'],
      species: json['species'],
      wand: json['wand'] != null ? Wand.fromJson(json['wand']) : null,
      yearOfBirth: json['yearOfBirth'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actor'] = this.actor;
    data['alive'] = this.alive;
    data['ancestry'] = this.ancestry;
    data['dateOfBirth'] = this.dateOfBirth;
    data['eyeColour'] = this.eyeColour;
    data['gender'] = this.gender;
    data['hairColour'] = this.hairColour;
    data['hogwartsStaff'] = this.hogwartsStaff;
    data['hogwartsStudent'] = this.hogwartsStudent;
    data['house'] = this.house;
    data['image'] = this.image;
    data['name'] = this.name;
    data['patronus'] = this.patronus;
    data['species'] = this.species;
    data['yearOfBirth'] = this.yearOfBirth;
    if (this.wand != null) {
      data['wand'] = this.wand.toJson();
    }
    return data;
  }
}
