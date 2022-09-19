// Main.dart :

import 'package:flutter/material.dart';
import 'package:lab6/pages/choose_location.dart';
import 'package:lab6/pages/home.dart';
import 'package:lab6/pages/loading.dart';

/*
10
void main() => runApp(MaterialApp(
// home: Home(),
routes: { // routes is Map variable with 'key:value' pairs
// '/about' ....eg.....routes the screen through 'about' widgets
// '/contact'....
'/': (context) => Loading(), // base routes....base widget file...main
file of project
// above statement will creates error...because it conflict with 'home:
Home(),
// because both statements tell flutter to initialize the app from their
given
location
'/home': (context) => Home(),
'/location': (context) => ChooseLocation(),
}
));
*/
void main() => runApp(MaterialApp(
// home: Home(),
// instead of making home: property to make any page to initialize at
//     beginning...
// we can use following code ....
// initialRoute: '/home',
        initialRoute: '/location',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/location': (context) => ChooseLocation(),
        }));



// home.dart :



import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(Icons.edit_location),
            label: Text('EDIT LOCATION'),
          )
        ],
      )),
    );
  }
}



// choose_location.dart :



import 'package:flutter/material.dart';
class ChooseLocation extends StatefulWidget {
// const ChooseLocation({Key? key}) : super(key: key);
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    // print('BUILD FUNCTION RUN IN CHOOSE LOCATION...');
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('CHHOSE LOCATION'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}



// loading.mart :



import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
// const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async {
  // String username = await Future.delayed(Duration(seconds: 4), () {
  // return 'UNIVERSITY NAME : DDU';
  // });
  //
  // String bio = await Future.delayed(Duration(seconds: 2), () {
  // return 'DDU IS ONE OF THE BEST UNIVERSITY OF GUJARAT FOR '
  // 'COMPUTER ENGINEERING STUDY';
  // });
  //
  // print('$username -> $bio');
  //
  //
  // }
  //
  // @override
  // void initState() {
  // super.initState();
  // print('INIT STATE FUNCTION RUN IN CHOOSE LOCATION...');
  // print('before getdata call');
  // getData();
  // print('after getdata call');
  // }
  void getData() async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    print(response.body); // it response in JSON form out put ...we need
    // MAPformat..
// print(response.body.userId); // this will not work. because its not
//     MAPformat..
// TO CONVERT JSON TO MAP..WE NEED TO IMPORT convert package....
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('LOADING SCREEN'),
    );
  }
}
