import 'package:dogapp/models/favorite_service.dart';
import 'package:flutter/material.dart';


class FavoriteButton extends StatefulWidget {
  final String imagePath;

  const FavoriteButton({Key? key, required this.imagePath}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    bool isFavorite = await FavoritesManager.isFavorite(widget.imagePath);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  void _toggleFavorite() async {
    await FavoritesManager.toggleFavorite(widget.imagePath);
    _checkIfFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : Colors.white,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
