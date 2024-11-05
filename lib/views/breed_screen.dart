// ignore_for_file: empty_catches

import 'package:dogapp/models/image_of_breed.dart';
import 'package:dogapp/models/list_of_dog.dart';
import 'package:dogapp/services/api_call.dart';
import 'package:dogapp/themes/app_theme.dart';
import 'package:dogapp/utils/app_routing.dart';
import 'package:dogapp/widgets/favorite_button.dart';
import 'package:dogapp/widgets/button_randomImage.dart';
import 'package:dogapp/widgets/buttons_sub_breed_list.dart';
import 'package:dogapp/widgets/card_breed_image.dart';
import 'package:dogapp/widgets/card_listdog.dart';
import 'package:dogapp/widgets/card_nosubbreed.dart';
import 'package:dogapp/widgets/card_random_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';

class Breedscreen extends StatefulWidget {
  const Breedscreen({super.key, required this.breedforsearch});

  final String breedforsearch;
  @override
  State<Breedscreen> createState() => _BreedscreenState();
}

class _BreedscreenState extends State<Breedscreen> {
  List<ImageOfBreed> imageOfBreed = [];
  List<ImageOfBreed> randomImage = [];
  List<ListOfDogs> listOfSubBreed = [];
  bool _isImageVisible = false;
  bool _isAllertVisible = false;
  bool _isContainerVisible = false;
  int topContainer = 1;
  int botContainer = 10;
  String mainBreed = '';

  Future<void> _loadSubBreed() async {
    try {
      listOfSubBreed =
          await DataProvider().fetchSubBreeds(widget.breedforsearch);
      setState(() {});
    } catch (e) {}
  }

  Future<void> _loadImage() async {
    try {
      imageOfBreed = await DataProvider().fetchImage(widget.breedforsearch);
      setState(() {});
    } catch (e) {}
  }

  Future<void> _loadRandomImage() async {
    try {
      randomImage =
          await DataProvider().fetchRandomImage(widget.breedforsearch);
      setState(() {});
    } catch (e) {}
  }

  @override
  void initState() {
    mainBreed = widget.breedforsearch;
    super.initState();
    _loadImage();
    _loadRandomImage();
    _loadSubBreed();
  }

  void _toggleContainerAllert() {
    setState(() {
      _isAllertVisible = !_isAllertVisible;
    });
  }

  void _toggleContainer() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
    });
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
          widget.breedforsearch,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Stack(
        children: [
          Column(
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
                            if ((topContainer == 4) &&
                                (_isImageVisible == false)) {
                              topContainer = 1;
                              botContainer = 10;
                            }
                          },
                          child: _isImageVisible
                              ? ButtonClose()
                              : ButtonRandomimage()),
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: imageOfBreed.length,
                      itemBuilder: (context, index) {
                        return CardBreedImage(
                            image: imageOfBreed[index].image,
                            custom_widget: FavoriteButton(
                              imagePath: imageOfBreed[index].image,
                            ));
                      },
                    ),
                  )),
            ],
          ),
          if (_isContainerVisible)
            ListOfSub(
              closer: GestureDetector(
                  onTap: () {
                    _toggleContainer();
                  },
                  child: ButtonCloseList()),
              list: Expanded(
                child: ListView.builder(
                  itemCount: listOfSubBreed.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => goRouter.pushNamed(AppRoute.subBreed.name, pathParameters: {'mainBreed' : mainBreed, 'subBreed' : listOfSubBreed[index].name} ),
                      child: CardListdog(breed: listOfSubBreed[index].name),
                    );
                  },
                ),
              ),
            ),
          if (_isAllertVisible)
            CardNosubbreed(
                customWidget: GestureDetector(
              onTap: () {
                _toggleContainerAllert();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.225,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Close")),
              ),
            ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 47, 47, 47),
        onPressed: () {
          if ((listOfSubBreed.isNotEmpty) && (_isContainerVisible == false)) {
            _toggleContainer();
          }
          if (listOfSubBreed.isEmpty) _toggleContainerAllert();
        },
        label: const Text("Sub Breed"),
      ),
    );
  }
}
