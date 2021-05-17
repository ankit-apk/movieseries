import 'package:get/get.dart';
import 'package:movieseries/models/movies_model.dart';
import 'package:movieseries/networking/networking.dart';

class User {
  final name = ''.obs;
}

class MovieController extends GetxController {
  var isLoading = true.obs;
  var movieList = List<Result>.empty(growable: true).obs;
  final user = User().obs;

  @override
  void onInit() {
    fetchmovies();
    super.onInit();
  }

  void fetchmovies() async {
    try {
      isLoading(true);
      var movies = await ApiService().fetchmovies();

      if (movies != null) {
        movieList.addAll(movies.results);
      }
    } finally {
      isLoading(false);
    }
  }
}

class MovieSearchController extends GetxController {
  var movieList = List<Result>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSearchedMovies();
  }

  fetchSearchedMovies() async {
    var movies = await ApiService().fetchSearchedMovie(Get.arguments);

    try {
      if (movies != null) {
        movieList.addAll(movies.results);
      }
    } finally {
      isLoading(false);
    }
  }
}
