import 'package:flutter/material.dart';
import 'package:fluttercart/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HandCart extends StatefulWidget {
  final List<HandCraft> _cart;
  HandCart(this._cart);
  @override
  _HandCartState createState() => _HandCartState();
}

class _HandCartState extends State<HandCart> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _name;
  Future<int> _counter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
        "HandCraft",
        style: TextStyle(color: Colors.blueGrey,
        fontSize: 14),
    ),
    leading: InkWell(
    onTap: (){
    Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back,
    color: Colors.black,),
    ),),

    body:  Container(
        decoration:BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/story.gif"),
              fit: BoxFit.cover,
              alignment: Alignment.center

            )
        ) ,
        child: ListView.builder (
            itemCount: widget._cart.length,
            itemBuilder:(context ,index){

          var item= widget._cart[index];
          int a =item.price;

  share() async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
           String name= prefs.getString(item.name);
           return prefs;
          }
          Future<void> _incrementCounter() async {
            final SharedPreferences prefs = await _prefs;
            final int counter = (prefs.getInt('counter') ?? 0) + 1;

            setState(() {
              _counter = prefs.setInt("counter", counter).then((bool success) {
                return counter;
              });
            });
          }
          Future<void> _share() async {
            final SharedPreferences prefs = await _prefs;
            final String  name = (prefs.getString(item.name) );

            setState(() {
              _name = prefs.setString("",name).then((bool success) {
                return _name;
              });
            });
          }
     int tot;
     return  FutureBuilder(
future: _name,
         builder:(BuildContext context, AsyncSnapshot<String> snapshot)
    { return
        Card (
              elevation: 4.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.network(item.Image),
                    title: Text(item.name),
                    trailing: GestureDetector(
                      child:
                      Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: (){
                        setState(() {
                          widget._cart.remove(item);
                        });
                      },


                    ),

                  ),

                ],
              ),
            );
    }
     );
        }),
      ),
    );

  }

}
