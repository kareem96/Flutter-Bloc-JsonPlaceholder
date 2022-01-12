



import 'package:abdul_karim_test/bloc/state/data_state.dart';
import 'package:abdul_karim_test/bloc/user_bloc.dart';
import 'package:abdul_karim_test/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  static const routeName = 'list_page';
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LIST'),),
      body: BlocBuilder<UserBloc, DataState<List<User>>>(
        builder: (context, state){
          if(state is DataStateLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is DataStateSuccess){
            return ListView.builder(
              itemCount: state.data?.length,
              itemBuilder: (context, index){
                return Container(
                  color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                  child: ListTile(),
                );
              },
            );
          }
          if(state is DataStateEmpty){
            return Center(child: Text('Error'),);
          }
          return SizedBox();
          },
      ),
    );
  }
}


/*class ListUser extends StatelessWidget {
  final User? user;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const ListUser({Key? key,
    this.user,
    this.animationController,
    this.animation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child){
          return FadeTransition(opacity: animation!, child: Transform(
            transform: Matrix4.translationValues(0.0, 10 * (1.0 - animation!.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              child: (
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Stack(
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(user!.title),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),);
        }
    );
  }
}*/



