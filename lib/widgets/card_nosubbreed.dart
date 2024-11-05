import 'package:flutter/material.dart';


class CardNosubbreed extends StatelessWidget{
  final Widget customWidget;

  const CardNosubbreed({super.key,
    required this.customWidget,
  });

  @override
  Widget build(BuildContext context) {
    return
        Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 47, 47, 47),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  "This breed doesn't have a sub-breed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            customWidget
          ],
        ),
      ),
    );
  }
}
