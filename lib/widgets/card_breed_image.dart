import 'package:flutter/material.dart';

class CardBreedImage extends StatelessWidget {
  String image;
  Widget custom_widget;

  CardBreedImage({
    super.key,
    required this.image,
    required this.custom_widget
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 35, 35),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [custom_widget],
        ),
      ),
    );
  }
}
