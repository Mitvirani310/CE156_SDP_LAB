// Code test: 1: Images

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  //home is property and after: is its value widget.
  //scaffold is widgets built in flutter scaffold is
  //   one type of layout manager.
    home: Homescreen(),
));
class Homescreen extends StatelessWidget {
// const test1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'HELLO FLUTTER...MY FIRST APP'),
          centerTitle: true,
          backgroundColor: Colors.red[600],
        ),
        body: Center(
          child: Image(

              image:
              AssetImage('assets/sub_assets/virat.jpg'),
        )
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {}, // must required property...
// making change at here to test hot reloading..click
//     --> click me---> Click and ctrl + s
    child: Text('Click'),
    backgroundColor: Colors.red[600],
    ),
    );
  }
}

// Code test: 2: Icon

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      //home is property and after: is its value widget.
      //scaffold is widgets built in flutter scaffold is
      //   one type of layout manager.
      home: Homescreen(),
    ));

//making your own custom stateless widget...
//used in hot reload and also useful in reuse...DRY
// feature
class Homescreen extends StatelessWidget {
  //const test1((key? key1)) super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICON WIDGET APP'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
          child: Icon(
        Icons.flutter_dash,
        color: Colors.amber,
        size: 80.0,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, //must required property..
        //making change at here to test hot
        // reloading...click --> click
        // me ---> click and control +s
        child: Text('Click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}

// code test 3 : Buttons

import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
      //home is property and after: is its value widget.
      //scaffold is widgets built in flutter scaffold is
      //   one type of layout manager.
      home: Homescreen(),
    ));

//making your own custom stateless widget...
//used in hot reload and also useful in reuse...DRY
// feature
class Homescreen extends StatelessWidget {
// const test1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUTTONS WIDGET APP'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Button Mit'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Colors.purple[800],
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // must required
        // property...
// making change at here to test hot reloading..click
//           --> click me---> Click and ctrl + s
        child: Text('Click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}


// code test 4 : 

import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  //home is property and after: is its value widget.
  //scaffold is widgets built in flutter scaffold is
  //   one type of layout manager.
    home: Homescreen(),
));
//making your own custom stateless widget...
//used in hot reload and also useful in reuse...DRY
// feature
class Homescreen extends StatelessWidget{
  //const test1((key? key1)) super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title:Text('ICON WIDGET APP'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: FlatButton(
        onPressed:()
        {
          print('print on console');
        },
        child: Text('click me Mit'),
        color: Colors.blue,
      ),
    );
  }
}

// code test 5 : 

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      //home is property and after: is its value widget.
      //scaffold is widgets built in flutter scaffold is
      //   one type of layout manager.
      home: Homescreen(),
    ));

//making your own custom stateless widget...
//used in hot reload and also useful in reuse...DRY
// feature
class Homescreen extends StatelessWidget {
  //const test1((key? key1)) super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICON WIDGET APP'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: IconButton(
          icon: Icon(
            Icons. account_circle_rounded
,
            size: 50.0,
          ),
          tooltip: 'send mail me',
          onPressed: () {
            print('on console print');
          },
        ),
      ),
    );
  }
}

// code test 6 :

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      //home is property and after: is its value widget.
      //scaffold is widgets built in flutter scaffold is
      //   one type of layout manager.
      home: Homescreen(),
    ));

//making your own custom stateless widget...
//used in hot reload and also useful in reuse...DRY
// feature
class Homescreen extends StatelessWidget {
  //const test1((key? key1)) super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICON WIDGET APP'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: TextButton.icon(
          icon: Icon(
            Icons.photo_camera,
            color: Colors.greenAccent,
            size: 50.0,
          ),
          label: Text(
            "Gallery Mit",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              letterSpacing: 2.0,
              backgroundColor: Colors.redAccent,
            ),
            textAlign: TextAlign.start,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}


// code test 7 :

import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  //home is property and after: is its value widget.
  //scaffold is widgets built in flutter scaffold is
  //   one type of layout manager.
    home: Homescreen(),
));
//making your own custom stateless widget...
//used in hot reload and also useful in reuse...DRY
// feature
class Homescreen extends StatelessWidget {
  //const test1((key? key1)) super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICON WIDGET APP'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            icon: Icon(
              Icons.account_circle,
              color:Colors.greenAccent,
              size: 50.0,
            ),
            label: Text(
              " Mit Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                letterSpacing: 2.0,
                backgroundColor: Colors.redAccent,
              ),
              textAlign: TextAlign.start,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}








