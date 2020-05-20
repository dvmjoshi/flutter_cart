import 'package:flutter/material.dart';
import 'package:fluttercart/flip.dart';
import 'package:fluttercart/handcart.dart';
import 'package:fluttercart/utils.dart';

import 'header.dart';
import 'model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HandCraft> _data = List<HandCraft>();
  List<HandCraft> _cart = List<HandCraft>();

  void _handcraft() {
    var list = <HandCraft>[
      HandCraft(
          name: "kedar temple",
          des: "made by dviyam joshi",
          price: 2000,
          Image: "https://images.pexels.com/photos/2766335/pexels-photo-2766335.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          author: "By: Divyam"),
      HandCraft(
          name: "kedar temple",
          des: "made by mike",
          price: 2000,
          Image: "https://i.pinimg.com/originals/b1/bc/05/b1bc05d595216e6ec5a5448e3a0e1c99.jpg",
          author: "By: mike"),
      HandCraft(
          name: "kedar temple",
          des: "made by dviyam joshi",
          price: 2000,
          Image: "asse",
          author: "By: Divyam"),
      HandCraft(
          name: "kedar temple",
          des: "made by dviyam joshi",
          price: 5000,
          Image: "asse",
          author: "By: Divyam"),
      HandCraft(
          name: "kedar temple",
          des: "made by dviyam joshi",
          price: 2000,
          Image: "asse",
          author: "By: Divyam"),      HandCraft(
          name: "kedar temple",
          des: "made by dviyam joshi",
          price: 2000,
          Image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ-ExIMPpdR0MZDAqXGKEkd8A_cEVGNeLMfB3z4Ar9FofqXymKi&usqp=CAU",
          author: "By: Divyam"),
      HandCraft(
          name: "kedar temple",
          des: "made by dviyam joshi",
          price: 2000,
          Image: "asse",
          author: "By: Divyam"),      HandCraft(
          name: "kedar temple",
          des: "made by dviyam joshi",
          price: 2000,
          Image: "asse",
          author: "By: Divyam"),


    ];
    setState(() {
      _data = list;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handcraft();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f2fc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "HandCraft",
          style: TextStyle(color: Colors.blueGrey,
          fontSize: 14),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36,
                    color: Colors.black,
                  ),
                  if (_cart.length > 0)
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cart.length.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    )
                ],
              ),
              onTap: () {
                if (_cart.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HandCart(_cart),
                  ));
                }
              },
            ),
          )
        ],
      ),
      body:  Column(
        children: <Widget>[
          FlippableExample(),
          SizedBox(height: 15,),
          HeaderWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    var item = _data[index];
                    return Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.network(item.Image),
                        title: Text(item.name),
                        subtitle: new RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: item.author),
                              TextSpan(
                                  text: 'at',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54)),
                              TextSpan(
                                text: item.price.toString(),
                              )
                            ],
                          ),
                        ),
                        trailing: GestureDetector(
                          child: (!_cart.contains(item))
                              ? Icon(
                            Icons.favorite_border,
                          )
                              : Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              if (!_cart.contains(item))
                                _cart.add(item);
                              else
                                _cart.remove(item);
                            });
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      )
    );
  }


}
