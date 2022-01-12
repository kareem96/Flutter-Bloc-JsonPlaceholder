


import 'package:abdul_karim_test/data/local/sharedpref.dart';
import 'package:abdul_karim_test/data/model/form_user.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  SharedPref sharedPref = SharedPref();
  FormUser saveForm = FormUser();
  FormUser loadForm = FormUser();

  loadSharedPrefs() async{
    try{
      FormUser user = FormUser.fromJson(await sharedPref.read('user'));
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('Loaded..'),
        duration: Duration(milliseconds: 1000)));
      setState(() {
        loadForm = user;
      });
    }catch (e){
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('Not found..'),
        duration: Duration(milliseconds: 1000),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FORM'),),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey ,width: 2),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      label: const Text('Name'),
                    ),
                    onChanged: (value){
                      setState(() {
                        saveForm.name = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey ,width: 2),
                          borderRadius: BorderRadius.circular(10.0)),
                      label: const Text('Age'),
                    ),
                    onChanged: (value){
                      setState(() {
                        saveForm.age = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: (){
                      sharedPref.save('user', saveForm);
                      Scaffold.of(context).showSnackBar(const SnackBar(
                        content: Text('Saved'),
                        duration: Duration(milliseconds: 1000),
                      ));
                    },
                    child: const Text('Save')
                ),
                ElevatedButton(
                    onPressed: (){
                      loadSharedPrefs();
                    },
                    child: const Text('Load')
                ),
                ElevatedButton(
                    onPressed: (){
                      sharedPref.remove('user');
                      Scaffold.of(context).showSnackBar(const SnackBar(
                          content: Text('Cleared')
                      ));
                      setState(() {
                        loadForm = FormUser();
                      });
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red
                  ),
                  child: const Text('Remove'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100,),
          SizedBox(
            child: Column(
              children: [
                Text('Name: ' + (loadForm.name ?? '')),
                const SizedBox(height: 10,),
                Text('Age: ' + (loadForm.age ?? '')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
