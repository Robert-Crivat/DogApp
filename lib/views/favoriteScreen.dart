import 'package:flutter/material.dart';

var bgcolor = const Color(0xFF000000);

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: bgcolor,
        title: const Text(
          "Favorite Screen",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}
