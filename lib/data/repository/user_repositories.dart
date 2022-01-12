

import 'dart:convert';
import 'package:abdul_karim_test/bloc/state/data_state.dart';
import 'package:abdul_karim_test/data/api/api_service.dart';
import 'package:abdul_karim_test/data/model/user.dart';



class UserRepository{
  Future<DataState<List<User>>> getUserList() async{

    final response = await ApiService().getList();

    print(response.body);
    if(response.statusCode < 200 || response.statusCode >= 300 || !response.body.startsWith('{')){
      return DataStateError(message: response.body);
    }else{
      final List<dynamic> userJson = json.decode(response.body);
      return DataStateSuccess(data: userJson.map((x) => User.fromJson(x)).toList());
    }
  }
}
