
import 'package:abdul_karim_test/bloc/home_bottom_nav_cubit.dart';
import 'package:abdul_karim_test/bloc/user_bloc.dart';
import 'package:abdul_karim_test/ui/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeTab.routeName,
      routes: routes,
    );
  }
}

final routes = <String, WidgetBuilder>{
  HomeTab.routeName: (context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeBottomNavIndexBloc()),
      BlocProvider(create: (context) => UserBloc()),
    ],
    child: HomeTab(),
  )
};


