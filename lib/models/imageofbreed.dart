class ImageOfBreed {
  String image;

  ImageOfBreed({
    required this.image,
  });

  factory ImageOfBreed.fromJson(Map<String, dynamic> json) {
    return ImageOfBreed(
      image: json['message']??[],
    );
  }
}

List<ImageOfBreed> imageOfBreed = [];
