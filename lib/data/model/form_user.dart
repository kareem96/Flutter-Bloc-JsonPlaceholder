


class FormUser {
  String? name;
  String? age;
  FormUser();

  FormUser.fromJson(Map<String, dynamic> json) :
      name = json['name'],
      age = json['age'];

  Map<String, dynamic> toJson() => {
    'name':name,
    'age':age,
  };
}