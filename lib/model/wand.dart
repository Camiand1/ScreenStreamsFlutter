class Wand {
  String core;
  String wood;

  Wand({this.core, this.wood});

  factory Wand.fromJson(Map<String, dynamic> json) {
    return Wand(
      core: json['core'],
      wood: json['wood'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core'] = this.core;
    data['wood'] = this.wood;
    return data;
  }
}
