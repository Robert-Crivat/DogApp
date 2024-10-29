// ignore_for_file: prefer_const_constructors, prefer_is_empty, use_key_in_widget_constructors

import 'dart:async';
import 'dart:convert';
import 'package:dogapp/models/listofdogs.dart';
import 'package:dogapp/views/BreedScreen.dart';
import 'package:dogapp/views/favoriteScreen.dart';
import 'package:dogapp/widgets/card_listdog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var bgcolor = Color(0xFF000000);

class Home extends StatefulWidget {
  Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<ListOfDogs>> fetchDog() async {
    listofDogs = [];
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      Map<String, dynamic> breeds = jsonResponse['message'];
      breeds.forEach((key, value) {
        listofDogs.add(ListOfDogs(name: key));
      });
      setState(() {
        listofDogs;
      });
      return listofDogs;
    } else {
      throw Exception("Failed to load, try again");
    }
  }

  @override
  void initState() {
    fetchDog();
    super.initState();
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
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
