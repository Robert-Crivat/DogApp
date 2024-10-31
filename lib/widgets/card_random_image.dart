import 'package:flutter/material.dart';

class CardRandomImage extends StatelessWidget {
  String image;

  CardRandomImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.6,
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
    );
  }
}
