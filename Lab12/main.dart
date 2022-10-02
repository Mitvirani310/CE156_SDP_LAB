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


//pubspec.yaml


name: lab11
description: A new Flutter project.

# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
version: 1.0.0+1

environment:
  sdk: ">=2.17.5 <3.0.0"

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5
  intl: ^0.17.0
  flutter_spinkit: ^5.1.0



  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^2.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/flags/
    - assets/images/
  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages


//word_time.dart

import 'dart:core';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WordTime {
  String? location; // REAL LOCATION NAME FOR UI

  String? time; // the time in that location..
  String? flag; // flag images related to location country...do it your self
  String?url; // end point of static url...which will change every time when location will change
  bool? isDayTime;
  WordTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    // Make Request for time and receive response
    try {
      Response response = await
      get(Uri.parse(
          'http://worldtimeapi.org/api/timezone/$url')); // Asia/Kolkata
      Map timeData = jsonDecode(response.body);
      // Get particular property form timeData...
      String dateTime = timeData['datetime'];
      String offset = timeData['utc_offset']; //not dst_offset
      String offsetHours = offset.substring(1, 3);
      String offsetMinutes = offset.substring(4, 6);
      // create DateTime object
      DateTime currenttime = DateTime.parse(dateTime);
      currenttime = currenttime.add(
          Duration(minutes:
          int.parse(offsetMinutes), hours: int.parse(offsetHours)));
      //set the time property of class...
      // time = currenttime.toString();
      isDayTime = (currenttime.hour > 18 && currenttime.hour < 20) ? true : false;

      time = DateFormat.jm().format(currenttime);
    }
    catch (e) {
      print('caught error : $e ');
      time = 'could not get time data';
    }
  }

}


//home.dart


import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'day2.jpg' : 'night.jpg';
    Color? appBgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[900];


    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {

                    dynamic result = await Navigator.pushNamed(context,'/location');

                    setState((){
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text(
                    'EDIT LOCATION',
                    style: TextStyle(

                      color: Colors.grey[300],
                      fontWeight: FontWeight.w300,

                      fontSize: 20,

                    ),
                  ),
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
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 36.0,

                    fontWeight: FontWeight.w500,
                    color: Colors.white70,

                  ),
                )
              ],
            ),
          )),
    ));
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
    WordTime timeinstance = WordTime(location: 'Catamarca',flag: 'india.png',url: 'America/Argentina/Catamarca');
    await timeinstance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : timeinstance.location,
      'flag' : timeinstance.flag,
      'time' : timeinstance.time,
      'isDayTime' : timeinstance.isDayTime,


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


//chooose_location.dart


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lab11/services/word_time.dart';


class ChooseLocation extends StatefulWidget {
// const ChooseLocation({Key? key}) : super(key: key);
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WordTime> locations = [
    WordTime(location: 'kolkata',flag: 'india.png',url: 'Asia/Kolkata'),
    WordTime(location: 'Manila',flag: 'philippines.png',url: 'Asia/Manila'),
    WordTime(location: 'Singapore',flag: 'singapore.png',url: 'Asia/Singapore'),
    WordTime(location: 'Brisbane',flag: 'australia.png',url: 'Australia/Brisbane'),
    WordTime(location: 'Madrid',flag: 'spain.png',url: 'Europe/Madrid'),
    WordTime(location: 'Vienna',flag: 'austria.png',url: 'Europe/Vienna'),
    WordTime(location: 'Maldives',flag: 'maldives.png',url: 'Indian/Maldives'),
    WordTime(location: 'Johannesburg',flag: 'south-africa.png',url:
    'Africa/Johannesburg'),
    WordTime(location: 'Barbados',flag: 'barbados.png',url: 'America/Barbados'),
    WordTime(location: 'Costa_Rica',flag: 'costa-rica.png',url:
    'America/Costa_Rica'),
    WordTime(location: 'Jamaica',flag: 'jamaica.png',url: 'America/Jamaica'),
    WordTime(location: 'Phoenix',flag: 'usa.png',url: 'America/Phoenix'),
    WordTime(location: 'Broken_Hill',flag: 'australia.png',url:
    'Australia/Broken_Hill'),
    WordTime(location: 'Moscow',flag: 'russia.png',url: 'Europe/Moscow'),
  ];

  void updateTime(index) async {
    WordTime instance = locations[index];
    await instance.getTime();
// navigate to home screen by popping instead of pushing new replica
// of home screen
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

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

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
// print(locations[index].location);
//                   print(locations[index].location);
                     updateTime(index);
                },
                title: Text(locations[index].location.toString()),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}

