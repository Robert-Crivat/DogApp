import 'package:flutter/material.dart';

class ButtonRandomimage extends StatelessWidget {
  const ButtonRandomimage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Center(child: Text("Random Image")));
  }
}

class ButtonClose extends StatelessWidget {
  const ButtonClose({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Center(child: Text("Close")));
  }
}
