import 'package:dogapp/models/imageofbreed.dart';
import 'package:dogapp/services/api_recall.dart';
import 'package:dogapp/views/CustomIconButton.dart';
import 'package:dogapp/widgets/card_breed_image.dart';
import 'package:dogapp/widgets/card_random_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

var bgcolor = const Color(0xFF000000);

class Breedscreen extends StatefulWidget {
  const Breedscreen({super.key, required this.breedforsearch});

  final String breedforsearch;
  @override
  State<Breedscreen> createState() => _BreedscreenState();
}

class _BreedscreenState extends State<Breedscreen> {
  List<ImageOfBreed> imageOfBreed = [];
  List<ImageOfBreed> randomImage = [];
  bool _isImageVisible = false;

  int topContainer = 1;
  int botContainer = 10;

  Future<void> _loadImage() async {
    try {
      imageOfBreed = await DataProvider().fetchImage(widget.breedforsearch);
      setState(() {});
    } catch (e) {
    }
  }

  Future<void> _loadRandomImage() async {
    try {
      randomImage =
          await DataProvider().fetchRandomImage(widget.breedforsearch);
      setState(() {});
    } catch (e) {
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImage();
    _loadRandomImage();
  }

  void _turnImageVisible() {
    setState(() {
      _isImageVisible = !_isImageVisible;
      topContainer = 4;
      botContainer = 3;
    });
  }

  void _reloadImage() {
    _loadRandomImage();
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
            flex: topContainer,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        _turnImageVisible();
                        if (_isImageVisible == false) _reloadImage();
                        if ((topContainer == 4) && (_isImageVisible == false)) {
                          topContainer = 1;
                          botContainer = 10;
                        }
                      },
                      child: _isImageVisible
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Center(child: Text("Close")),
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))))
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: const Center(child: Text("Random Image")),
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))))),
                  if (_isImageVisible)
                    GestureDetector(
                      onTap: () {
                        _reloadImage();
                      },
                      child: CardRandomImage(
                        image: randomImage[0].image,
                      ),
                    )
                ],
              ),
            ),
          ),
          Expanded(
              flex: botContainer,
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: imageOfBreed.length,
                  itemBuilder: (context, index) {
                    return CardBreedImage(
                      image: imageOfBreed[index].image,
                      custom_widget:
                          const CustomIconButton(icon: Icons.favorite),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
