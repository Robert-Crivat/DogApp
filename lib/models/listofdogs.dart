class ListOfDogs {
  String name;

  ListOfDogs({
    required this.name,
  });

  factory ListOfDogs.fromJson(Map<String, dynamic> json) {
    return ListOfDogs(name: json['name']);
  }
}

List<ListOfDogs> listofDogs = [];
