

import 'package:abdul_karim_test/bloc/state/data_state.dart';
import 'package:abdul_karim_test/data/model/user.dart';
import 'package:abdul_karim_test/data/repository/user_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<DataState<List<User>>>{
  UserBloc(): super(DataStateEmpty()){
    loadUserList();
  }

  void loadUserList() {
    print('Load user...');
    emit(DataStateLoading());
    UserRepository().getUserList().then((value) => emit(value));
  }
}



