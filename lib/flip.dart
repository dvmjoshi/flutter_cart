import 'package:flippable_box/flippable_box.dart';
import 'package:flutter/material.dart';
import 'package:motion_widget/motion_widget.dart';
class FlippableExample extends StatefulWidget {
  @override
  _FlippableExampleState createState() => _FlippableExampleState();
}

class _FlippableExampleState extends State<FlippableExample> with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  List<String> photos = [
    "assets/cap.jpeg",
    "assets/spoon.jpeg"

  ];
  int index =0;
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    // super.initState();
    animationController =
    new AnimationController(duration: Duration(seconds:4), vsync: this);
    animation =
    IntTween(begin: 0, end: photos.length-1 ).animate(animationController)
      ..addListener((){
        setState(() {
          index=animation.value;
        });
      });

    animationController.repeat(period: Duration(seconds: 20));
  }
  @override
  Widget build(BuildContext context) {
    return  Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => setState(() => _isFlipped = !_isFlipped),
              child: FlippableBox(
                front: imageCard(photos[index],
                    380, 220),
                back:impinfo() ,
//                imageCard("https://images.unsplash.com/photo-1583259529675-4338f4f241be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
//                    400, 350),
                flipVt: false,
                isFlipped: _isFlipped,
                  bg: BoxDecoration(color: Colors.white), //Paints the box itself with a shared background
                  duration: 0.5, //half second duration
                  curve: Curves.easeOut
              ),
            ),
          ),
        );
  }


}
Container imageCard(String image,double width, double height) {
  return Container(
    height: height,
    width: width,
    margin: EdgeInsets.only(left: 0, right: 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          blurRadius: 7,
          spreadRadius: 3,
          color: Colors.blue[900].withOpacity(0.1),
        )
      ],
    ),
  );
}

impinfo (){
  MotionExitConfigurations motionExitConfigurations;
  return Container(
    height: 263,
    width: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      image: DecorationImage(
        image: AssetImage("assets/home.gif"),
        fit: BoxFit.contain,
        alignment: Alignment.centerRight

      ),

            boxShadow: <BoxShadow>[
        BoxShadow(
          blurRadius: 7,
          spreadRadius: 3,
          color: Colors.white.withOpacity(0.1),
        )
      ],
    ),
    child: Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Motion<Column>(
              durationMs: 2500,
              crossAxisAlignment: CrossAxisAlignment.start,
             exitConfigurations: motionExitConfigurations,
              children: <Widget>[
                MotionElement(
                  interval: Interval(0.0, 0.30),
                  displacement: 20,
                  child: Text(
                    "Stay At Home",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(height: 30),
                getFeatureItem(
                    Interval(0.3, 1.0), "HAND: Wash them often"),
                SizedBox(height: 10),
                getFeatureItem(
                    Interval(0.4, 1.0), "ELBOW: Cough into it"),
                SizedBox(height: 10),
                getFeatureItem(Interval(0.58, 1.0), "SPACE: Keep safe distance"),
                SizedBox(height: 10),
                getFeatureItem(Interval(0.5, 1.0), "FACE: Don't touch it"),
                SizedBox(height: 10),

//                getFeatureItem(
//                    Interval(0.63, 1.0), "Support for Translate & Fade modes"),
//                SizedBox(height: 0),
//                getFeatureItem(
//                    Interval(0.67, 1.0), "Provides Exit transitions"),
//                SizedBox(height: 10),
//                getFeatureItem(Interval(0.7, 1.0), "No code clean-up required"),
//                SizedBox(height: 10),
//                getFeatureItem(Interval(0.72, 1.0), "Looks very cool! ;)"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
MotionElement getFeatureItem(Interval interval, String text) {
  return MotionElement(
    interval: interval,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.check,
          color: Colors.blueAccent,
        ),
        SizedBox(width:6),
        Flexible(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}