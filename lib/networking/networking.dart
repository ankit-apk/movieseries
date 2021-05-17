import 'package:movieseries/models/movies_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Movies> fetchmovies() async {
    var client = http.Client();

    var response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=106aeb67d3c86a97bb7a549b6b21c73f&language=en-US"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return moviesFromJson(jsonString);
    }
  }

  Future<Movies> fetchSearchedMovie(String query) async {
    var client = http.Client();

    var response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=106aeb67d3c86a97bb7a549b6b21c73f&query=$query'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return moviesFromJson(jsonString);
    }
  }
}
