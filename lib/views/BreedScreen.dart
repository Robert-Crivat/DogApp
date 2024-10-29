import 'package:dogapp/models/imageofbreed.dart';
import 'package:dogapp/views/CustomIconButton.dart';
//import 'package:dogapp/views/CustomIconButton.dart';
import 'package:dogapp/widgets/card_breed_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var bgcolor = Color(0xFF000000);

class Breedscreen extends StatefulWidget {
  Breedscreen({super.key, required this.breedforsearch});

  final String breedforsearch;

  @override
  State<Breedscreen> createState() => _BreedscreenState();
}

class _BreedscreenState extends State<Breedscreen> {
  List<ImageOfBreed> imageOfBreed = [];

  Future<void> fetchDog() async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/${widget.breedforsearch}/images'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> values = jsonResponse['message'];

      if (values.isNotEmpty) {
        setState(() {
          imageOfBreed =
              values.map((value) => ImageOfBreed(image: value)).toList();
        });
      }
    } else {
      throw Exception("Failed to load, try again");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: bgcolor,
          title: Text(
            widget.breedforsearch,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(child: Text("Random image"))],
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: SizedBox(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: imageOfBreed.length,
                    itemBuilder: (context, index) {
                      return CardBreedImage(
                        image: imageOfBreed[index].image,
                        custom_widget: CustomIconButton(icon: Icons.favorite),
                      );
                    },
                  ),
                ))
          ],
        ),
    );
  }
}
