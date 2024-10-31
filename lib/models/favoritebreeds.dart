class Favoritebreeds {
  final String id;
  final String img_url;

  Favoritebreeds({required this.id, required this.img_url});

  Map<String, dynamic> toJson() => {'id': id, 'name': img_url};
  static Favoritebreeds fromJson(Map<String, dynamic> json) =>
      Favoritebreeds(id: json['id'], img_url: json['name']);
}
