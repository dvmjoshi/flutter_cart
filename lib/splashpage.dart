import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercart/Homepage.dart';
import 'package:motion_widget/motion_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MotionExitConfigurations motionExitConfigurations;

  @override
  void initState() {
    super.initState();

    motionExitConfigurations =
        MotionExitConfigurations(durationMs: 800, displacement: 60);

    Future.delayed(Duration(seconds: 5), () {
      motionExitConfigurations.controller.addStatusListener((status) {
        if (status == AnimationStatus.completed)
          Navigator.pushReplacement(context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => HomePage()));
      });
      motionExitConfigurations.controller.forward();
    });
   // startTimer();
  }
//  void startTimer() {
//    Timer(Duration(seconds: 2), () async {
//      Navigator.of(context).push(MaterialPageRoute(
//        builder: (context)=>HomePage(),
//      ));
//    });
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
           Container(
             decoration:BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/story.gif"),
                   fit: BoxFit.cover,
                 alignment:Alignment. center

               )
             ) ,
           ),
                Center(
                child: Motion<Row>(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  exitConfigurations: motionExitConfigurations,
                  children: <Widget>[
//                    MotionElement(
//                      child: Container(
//                        width: 200,
//                        height: 200,
//                        decoration: BoxDecoration(
//                            image: DecorationImage(
//                                image: AssetImage('assets/shadu.png')
//                            )
//                        )
//                        ,
//                      ),
//                      interval: Interval(0.5, 1.0, curve: Curves.easeOutBack),
//                    ),
//                    SizedBox(
//                      width: 20,
//                    ),

                    MotionElement(
                      child: Text(
                        "Buy local\nProduct",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      orientation: MotionOrientation.RIGHT,
                      interval: Interval(0.0, 0.5),
                    ),
    SizedBox(
                      width:200,
                    ),

                  ],
                )),
              ],
        ));
  }
}