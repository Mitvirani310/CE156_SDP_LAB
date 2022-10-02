//main.dart

import 'package:flutter/material.dart';
import 'package:lab11/pages/home.dart';
import 'package:lab11/pages/choose_location.dart';
import 'package:lab11/pages/loading.dart';
/*
void main() => runApp(MaterialApp(
// home: Home(),
routes: { // routes is Map variable with 'key:value' pairs
// '/about' ....eg.....routes the screen through 'about' widgets
// '/contact'....
'/': (context) => Loading(), // base routes....base widget file...main file of
project
// above statement will creates error...because it conflict with 'home: Home(),
// because both statements tell flutter to initialize the app from their given
location
'/home': (context) => Home(),
'/location': (context) => ChooseLocation(),
}
));
*/
void main() => runApp(MaterialApp(
// home: Home(),
// instead of making home: property to make any page to initialize at beginning...
// we can use following code ....
// initialRoute: '/home',
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }
));


//home.dart

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map<dynamic,dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context,'/location');
                  },

                  icon: Icon(Icons.edit_location),
                  label: Text('EDIT LOCATION'),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(

                        

                        letterSpacing: 2.0,
                        fontSize: 28.0,

                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 70.0,
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}


//loading.dart

import 'package:flutter/material.dart';
import 'package:lab11/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  void setWorldTime() async {
    WordTime timeinstance = WordTime(location: 'kolkata',flag: 'india.png',url: 'Asia/Kolkata');
    await timeinstance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : timeinstance.location,
      'flag' : timeinstance.flag,
      'time' : timeinstance.time,

    });
  }
  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 90.0,
          ),
        )
    );
  }
}

