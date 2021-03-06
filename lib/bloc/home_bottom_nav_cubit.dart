


import 'package:abdul_karim_test/ui/form_page.dart';
import 'package:abdul_karim_test/widget/card_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomNavIndexBloc extends Cubit<int>{
  HomeBottomNavIndexBloc(): super(0);
  void changeBottomNavIndex(int newIndex) => emit(newIndex);

  List<Widget> pages = [
    UserList(),
    FormPage(),
  ];
}