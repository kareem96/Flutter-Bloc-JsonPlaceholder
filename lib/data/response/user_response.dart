/*




import 'package:abdul_karim_test/data/model/user.dart';

class UserResponse{
  final List<User> user;

  UserResponse({this.user = const []});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    user: json['user'] == null ? []
        :(json['user'] as Iterable).map<User>((e) => User.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'user': user.map((e) => e.toJson()).toList(),
  };
}
*/
