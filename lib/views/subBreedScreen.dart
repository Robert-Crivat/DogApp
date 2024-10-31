import 'package:dogapp/models/listofdogs.dart';
import 'package:dogapp/services/api_recall.dart';
import 'package:dogapp/views/SubBreedImage.dart';
import 'package:dogapp/widgets/cardSubBreed.dart';
import 'package:flutter/material.dart';
import 'dart:async';

var bgcolor = const Color(0xFF000000);

class SubBreedScreen extends StatefulWidget {
  const SubBreedScreen({super.key, required this.breedforsearch});

  final String breedforsearch;
  @override
  State<SubBreedScreen> createState() => _SubBreedScreenState();
}

class _SubBreedScreenState extends State<SubBreedScreen> {
  List<ListOfDogs> listOfSubBreed = [];

  @override
  void initState() {
    super.initState();
    _loadSubBreed();
  }

  Future<void> _loadSubBreed() async {
    try {
      listOfSubBreed = await DataProvider().fetchSubBreeds(widget.breedforsearch);
      setState(() {}); // Update the UI
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: bgcolor,
        title: Text(
          widget.breedforsearch,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: SizedBox(
            child: ListView.builder(
              itemCount: listOfSubBreed.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Subbreedimage(
                                  mainBreed: widget.breedforsearch ,
                                  subBreed: listOfSubBreed[index].name,
                                )));
                  },
                  child: Cardsubbreed(breed: listOfSubBreed[index].name),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
