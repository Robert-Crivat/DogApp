// ignore_for_file: empty_catches

import 'package:dogapp/models/image_of_breed.dart';
import 'package:dogapp/services/api_call.dart';
import 'package:dogapp/themes/app_theme.dart';
import 'package:dogapp/widgets/favorite_button.dart';
import 'package:dogapp/widgets/button_randomImage.dart';
import 'package:dogapp/widgets/card_breed_image.dart';
import 'package:dogapp/widgets/card_random_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class Subbreedimage extends StatefulWidget {
  const Subbreedimage(
      {super.key, required this.mainBreed, required this.subBreed});

  final String mainBreed;
  final String subBreed;
  @override
  State<Subbreedimage> createState() => _SubbreedimageState();
}

class _SubbreedimageState extends State<Subbreedimage> {
  List<ImageOfBreed> imageOfSubBreed = [];
  List<ImageOfBreed> randomImage = [];
  bool _isImageVisible = false;
  int topContainer = 1;
  int botContainer = 10;

  @override
  void initState() {
    super.initState();
    _loadSubBreedImage();
    _loadRandomImage();
  }

  Future<void> _loadSubBreedImage() async {
    try {
      setState(() {
        imageOfSubBreed = [];
      });
      imageOfSubBreed = await DataProvider()
          .fetchImageOfSubBreed(widget.mainBreed, widget.subBreed);
      setState(() {});
    } catch (e) {}
  }

  Future<void> _loadRandomImage() async {
    try {
      randomImage = await DataProvider()
          .fetchRandomImagOfSubBreed(widget.mainBreed, widget.subBreed);
      setState(() {});
    } catch (e) {}
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
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          "${widget.mainBreed} ${widget.subBreed}",
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
                          ? const ButtonClose()
                          : const ButtonRandomimage()),
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
                  itemCount: imageOfSubBreed.length,
                  itemBuilder: (context, index) {
                    return CardBreedImage(
                            image: imageOfSubBreed[index].image,
                            custom_widget:FavoriteButton(imagePath: imageOfSubBreed[index].image,)
                          );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
