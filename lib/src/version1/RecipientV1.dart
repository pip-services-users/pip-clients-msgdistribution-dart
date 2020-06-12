class RecipientV1 {
  String id;
  String name;
  String email;
  String phone;
  String language;

  RecipientV1({this.id, this.name, this.email, this.phone, this.language});

  factory RecipientV1.fromJson(Map<String, dynamic> json) {
    var c = RecipientV1();
    c.fromJson(json);
    return c;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'language': language
    };
  }

  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    language = json['language'];
  }
}
