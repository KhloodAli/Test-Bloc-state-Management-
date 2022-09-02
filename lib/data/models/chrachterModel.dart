class Character {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<dynamic>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;

  Character(
      {this.charId,
      this.name,
      this.birthday,
      this.occupation,
      this.img,
      this.status,
      this.nickname,
      this.appearance,
      this.portrayed,
      this.category,
      this.betterCallSaulAppearance});

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];
    /* if (json['better_call_saul_appearance'] != null) {
      betterCallSaulAppearance = <Null>[];
      json['better_call_saul_appearance'].forEach((v) {
         betterCallSaulAppearance!.add(Null.fromJson(v));
      });
    } */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['occupation'] = this.occupation;
    data['img'] = this.img;
    data['status'] = this.status;
    data['nickname'] = this.nickname;
    data['appearance'] = this.appearance;
    data['portrayed'] = this.portrayed;
    data['category'] = this.category;
    if (this.betterCallSaulAppearance != null) {
      data['better_call_saul_appearance'] =
          this.betterCallSaulAppearance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
