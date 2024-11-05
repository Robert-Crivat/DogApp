import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static const String _favoritesKey = 'favorites';

  static Future<void> saveFavorites(List<String> favorites) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_favoritesKey, favorites);
  }

  static Future<List<String>> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  static Future<void> toggleFavorite(String imagePath) async {
    List<String> favorites = await loadFavorites();

    if (favorites.contains(imagePath)) {
      favorites.remove(imagePath);
    } else {
      favorites.add(imagePath);
    }
    
    await saveFavorites(favorites);
  }

  static Future<bool> isFavorite(String imagePath) async {
    List<String> favorites = await loadFavorites();
    return favorites.contains(imagePath);
  }
}
