import 'package:flutter/material.dart';

class ButtonCloseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Icon(Icons.close),
        ),
      ),
    );
  }
}

class ListOfSub extends StatelessWidget {
  final Widget closer;
  final Widget list;

  ListOfSub({
    required this.closer,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          closer,
          Container(
            margin: const EdgeInsets.only(bottom: 82),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 47, 47, 47),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: <Widget>[list],
            ),
          ),
        ],
      ),
    ));
  }
}
