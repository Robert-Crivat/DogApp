// ignore_for_file: prefer_const_constructors, prefer_is_empty, use_key_in_widget_constructors

import 'dart:async';
import 'package:dogapp/models/listofdogs.dart';
import 'package:dogapp/services/api_recall.dart';
import 'package:dogapp/views/BreedScreen.dart';
import 'package:dogapp/views/favoriteScreen.dart';
import 'package:dogapp/views/subBreedScreen.dart';
import 'package:dogapp/widgets/card_listdog.dart';
import 'package:flutter/material.dart';

var bgcolor = Color(0xFF000000);

class Home extends StatefulWidget {
  Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    _loadDogs();
  }

  Future<void> _loadDogs() async {
    try {
      listofDogs = await DataProvider().fetchDog();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgcolor,
        title: Text(
          "Dog List App ",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: PageView(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: listofDogs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Breedscreen(
                                      breedforsearch: listofDogs[index].name,
                                    )));
                      },
                      child: CardListdog(breed: listofDogs[index].name),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: listofDogs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubBreedScreen(
                                      breedforsearch: listofDogs[index].name,
                                    )));
                      },
                      child: CardListdog(breed: listofDogs[index].name),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteScreen()));},
        splashColor: Colors.redAccent,
        backgroundColor: const Color.fromARGB(255, 71, 69, 69),
        child: const Icon(Icons.favorite, color: Colors.red,),
      ),
    );
  }
}
