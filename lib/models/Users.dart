class Cusers {
  String userName;
  String uid;
  String Gsm;
  List basket;
  String Email;

  Cusers({
    required this.uid,
    required this.userName,
    required this.Email,
    required this.Gsm,
    required this.basket,
  });
  factory Cusers.fromJson(Map<String, dynamic> json) {
    return Cusers(
      uid: json["uid"],
      userName: json["userName"],
      Email: json["Email"],
      Gsm: json["Gsm"],
      basket: json["basket"],
    );
  }
// from object to json
  Map<String, dynamic> Tojson() {
    return {"uid": uid, "userName": userName, "Email": Email, "Gsm": Gsm, "basket": []};
  }
}
