import 'package:dogapp/models/favorite_service.dart';
import 'package:dogapp/widgets/favorite_button.dart';
import 'package:dogapp/widgets/card_breed_image.dart';
import 'package:flutter/material.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> _favoriteImages = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    List<String> favorites = await FavoritesManager.loadFavorites();
    setState(() {
      _favoriteImages = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorites"),
        ),
        body: Column(
          children: [
            _favoriteImages.isEmpty
                ? const Center(
                    child: Text(
                      "No favorites saved",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Expanded(
                    child: SizedBox(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemCount: _favoriteImages.length,
                        itemBuilder: (context, index) {
                          return CardBreedImage(
                            image: _favoriteImages[index],
                            custom_widget: FavoriteButton(
                                imagePath: _favoriteImages[index]),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ));
  }
}
