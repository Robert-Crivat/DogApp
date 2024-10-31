import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Cardsubbreed extends StatelessWidget {
  String breed;

  Cardsubbreed({super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.065,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 36, 35, 35), borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  breed,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Icon(AntDesign.right)
            ],
          ),
        ));
  }
}
