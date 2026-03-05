import 'dart:ffi';
//practise app for foo animatatio contains animated container and animated opacity
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: homescr(), debugShowCheckedModeBanner: false);
  }
}

class homescr extends StatefulWidget {
  const homescr({super.key});

  @override
  State<homescr> createState() => _homescrState();
}

class _homescrState extends State<homescr> {
  var _height = 300.0;
  var _width = 100.0;
  var flag = true;
  var opacity = 1.0;
  var isfirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //animated container
              AnimatedContainer(
                duration: Duration(seconds: 2),
                color: Colors.black,
                height: _height,
                width: _width,
              ),
              ElevatedButton(
                onPressed: () {
                  //toggeling animated container and animated opacity together
                  setState(() {
                    if (flag) {
                      _height = 100.0;
                      _width = 300.0;
                      opacity = 0.0;
                      flag = false;
                    } else {
                      _height = 300.0;
                      _width = 100.0;
                      opacity = 1.0;
                      flag = true;
                    }
                  });
                },
                child: Text("start"),
              ),
              AnimatedOpacity(
                opacity: opacity, // animated opacity
                duration: Duration(seconds: 2),
                curve: Curves.decelerate,
                child: Container(
                  height: _height,
                  width: _width,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 16),
              AnimatedCrossFade(
                //cross fade for two widgets to exchange with animation
                firstChild: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amberAccent,
                ),
                secondChild: Container(
                  width: 100,
                  height: 100,
                  color: Colors.redAccent,
                ),
                crossFadeState: isfirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 4),
              ),
              ElevatedButton(
                onPressed: () {
                  //toggling crossfade
                  setState(() {
                    isfirst = !isfirst;
                  });
                },
                child: Text("start"),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => secondscr()),
                  );
                },
                child: Hero(
                  tag: "backimg",
                  child: Image.asset('assets/images/img.png', height: 200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class secondscr extends StatefulWidget {
  const secondscr({super.key});

  @override
  State<secondscr> createState() => _secondscrState();
}

class _secondscrState extends State<secondscr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("this is Second Screen")),
      body: Hero(
        tag: "backimg",
        child: Center(child: Image.asset("assets/images/img.png")),
      ),
    );
  }
}
