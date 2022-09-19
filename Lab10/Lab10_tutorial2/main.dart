// main.dart :

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:lab6/services/word_time.dart';

void main() => runApp(MaterialApp(
// home: Home(),
// instead of making home: property to make any page to initialize at
//     beginning...
// we can use following code ....
// initialRoute: '/home',
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
        }));

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = 'LOADING..........';
  void setWorldTime() async {
    WordTime timeinstance =
        WordTime(location: 'kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await timeinstance.getTime();
// print(timeinstance.time);
    setState(() {
      time = timeinstance.time;
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
        body: Padding(
      padding: EdgeInsets.all(60.0),
      child: Text(time.toString()),
    ));
  }
}



// loading.dart :


import 'package:flutter/material.dart';
import 'package:lab6/services/word_time.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = 'LOADING..........';
  void setWorldTime() async {
    WordTime timeinstance =
        WordTime(location: 'kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await timeinstance.getTime();
// print(timeinstance.time);
    setState(() {
      time = timeinstance.time;
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
        body: Padding(
      padding: EdgeInsets.all(60.0),
      child: Text(time.toString()),
    ));
  }
}



// word_time.dart :



import 'dart:core';

import 'package:http/http.dart';
import 'dart:convert';

class WordTime {
  String? location; // REAL LOCATION NAME FOR UI
  String? time; // the time in that location..
  String? flag; // flag images related to location country...do it your
  // self
  String? url; // end point of static url...which will change every time
  // when location will change
  WordTime({this.location, this.flag, this.url});
  Future<void> getTime() async {
// Make Request for time and receive response
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')); //
    // Asia/Kolkata
    Map timeData = jsonDecode(response.body);
// Get particular property form timeData...
    String dateTime = timeData['datetime'];
    String offset = timeData['utc_offset']; //not dst_offset
    String offsetHours = offset.substring(1, 3);
    String offsetMinutes = offset.substring(4, 6);
// create DateTime object
    DateTime currenttime = DateTime.parse(dateTime);
    currenttime = currenttime.add(Duration(
        minutes: int.parse(offsetMinutes), hours: int.parse(offsetHours)));
//set the time property of class...
    time = currenttime.toString();
  }
}

