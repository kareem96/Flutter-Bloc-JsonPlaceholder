



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
          /*return FutureBuilder<bool>(
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
              if(!snapshot.hasData){
                return const SizedBox();
              }else{
                return ListView.builder(
                  itemCount: state.data!.length,
                  itemBuilder: (context, index) =>
                    Container(
                    color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                    child: Column(
                      children: [
                        Text('test')
                      ],
                    )
                  ),
                  *//*final int count = state.data!.length > 10 ? 10 : state.data!.length;
                    final Animation<double> animation = Tween<double>(
                      begin: 0.0, end: 1.0
                    ).animate(CurvedAnimation(parent: animationController!, curve: Interval(( 1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
                    return ListUser(
                      user: state.data![index],
                      animation: animation,
                      animationController: animationController,
                    );*//*
                );
              }
            },
          );*/
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



