import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorites';
  final List<String> _favorites = [];

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<void> addFavorite(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    if (!favorites.contains(item)) {
      favorites.add(item);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  Future<void> removeFavorite(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.remove(item);
    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<bool> isFavorite(String item) async {
    final favorites = await getFavorites();
    return favorites.contains(item);
  }

  List<String> get favorites {
    return _favorites;
  }
}
