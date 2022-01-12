

import 'package:abdul_karim_test/bloc/state/data_state.dart';
import 'package:abdul_karim_test/bloc/user_bloc.dart';
import 'package:abdul_karim_test/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List'),),
      body: SingleChildScrollView(
        child: BlocBuilder<UserBloc, DataState<List<User>>>(
          builder: (context, state) {
            if (state is DataStateLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DataStateError) {
              return Center(child: Text(state.message ?? 'Terjadi keslahan'),);
            }
            if (state is DataStateSuccess && state.data?.isNotEmpty == true) {
              return ListView.builder(
                itemCount: state.data?.length,
                itemBuilder: (context, index) => Container(
                  color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                  child: ListTile(
                    leading: Text(
                      'ID: ${state.data![index].id}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      )
    );
  }
}