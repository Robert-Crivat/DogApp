import 'dart:convert';
import 'package:dogapp/models/imageofbreed.dart';
import 'package:http/http.dart' as http;
import 'package:dogapp/models/listofdogs.dart';

class DataProvider {
  //#########################################################################
  // First fetch for the entire list of breeds
  //#########################################################################

  Future<List<ListOfDogs>> fetchDog() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      Map<String, dynamic> breeds = jsonResponse['message'];

      List<ListOfDogs> listofDogs = [];
      breeds.forEach((key, value) {
        listofDogs.add(ListOfDogs(name: key));
      });

      return listofDogs;
    } else {
      throw Exception("Failed to load dogs");
    }
  }

  //  End

  //#########################################################################
  //  First fetch for the entire list of Sub breeds
  //#########################################################################

  Future<List<ListOfDogs>> fetchSubBreeds(String breed) async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/$breed/list'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> subBreeds = jsonResponse['message'];
      List<ListOfDogs> listOfSubBreed = [];
      subBreeds.forEach((subBreed) {
        listOfSubBreed.add(ListOfDogs(name: subBreed));
      });
      return listOfSubBreed;
    } else {
      throw Exception("Failed to load, try again");
    }
  }
  //  End

  //#########################################################################
  //  Fetch for the entire list of image for Sub breeds
  //#########################################################################

  Future<List<ImageOfBreed>> fetchImageOfSubBreed(
      String mainBreed, String subBreed) async {
    final response = await http.get(
        Uri.parse('https://dog.ceo/api/breed/$mainBreed/$subBreed/images'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> subBreeds = jsonResponse['message'];

      // Clear the list before adding new images
      List<ImageOfBreed> imageOfBreed = []; // Create a new list

      subBreeds.forEach((subBreed) {
        imageOfBreed.add(ImageOfBreed(image: subBreed));
      });
      return imageOfBreed; // Return the new list
    } else {
      throw Exception("Failed to load, try again");
    }
  }

  //  End

  //#########################################################################
  //  Fetch for return a random image for Sub breed
  //#########################################################################

  Future<List<ImageOfBreed>> fetchRandomImagOfSubBreed(
      String mainBreed, String subBreed) async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/$mainBreed/$subBreed/images/random'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      String? value =
          jsonResponse['message'] as String?; // Explicitly cast to String

      List<ImageOfBreed> imageOfBreed = [];
      if (value != null) {
        // Check if value is not null
        imageOfBreed.add(ImageOfBreed(image: value));
      }
      return imageOfBreed;
    } else {
      throw Exception("Failed to load, try again");
    }
  }

  //  End

  //#########################################################################
  //  Fetch of image for the entire list of breeds
  //#########################################################################

  Future<List<ImageOfBreed>> fetchImage(String breed) async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/$breed/images'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> values = jsonResponse['message'];
      List<ImageOfBreed> imageOfBreed = [];
      values.forEach((value) {
        imageOfBreed.add(ImageOfBreed(image: value));
      });
      return imageOfBreed;
    } else {
      throw Exception("Failed to load, try again");
    }
  }
  //  End

  //#########################################################################
  //  Fetch for return a random image for breed
  //#########################################################################

  Future<List<ImageOfBreed>> fetchRandomImage(String breed) async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/$breed/images/random'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      dynamic value = jsonResponse['message']; // Changed to dynamic
      List<ImageOfBreed> imageOfBreed = [];
      if (value is String) {
        imageOfBreed.add(ImageOfBreed(image: value));
      }
      return imageOfBreed;
    } else {
      throw Exception("Failed to load, try again");
    }
  }

  //  End
}

