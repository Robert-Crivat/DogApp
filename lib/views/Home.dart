// ignore_for_file: prefer_const_constructors, prefer_is_empty, use_key_in_widget_constructors, empty_catches, library_private_types_in_public_api
import 'dart:async';
import 'package:dogapp/models/list_of_dog.dart';
import 'package:dogapp/services/api_call.dart';
import 'package:dogapp/themes/app_theme.dart';
import 'package:dogapp/utils/app_routing.dart';
import 'package:dogapp/views/breed_screen.dart';
import 'package:dogapp/views/favorite_screen.dart';
import 'package:dogapp/widgets/card_listdog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home();
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
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          "Dog List App ",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: listofDogs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => goRouter.pushNamed(AppRoute.breed.name,
                      extra: listofDogs[index].name),
                  child: CardListdog(breed: listofDogs[index].name),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goRouter.goNamed(AppRoute.favorite.name);
        },
        splashColor: Colors.redAccent,
        backgroundColor: const Color.fromARGB(255, 71, 69, 69),
        child: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );
  }
}
