import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieseries/controller/movies_controller.dart';

import 'movie_details.dart';

class SearchedMovie extends StatefulWidget {
  @override
  _SearchedMovieState createState() => _SearchedMovieState();
}

class _SearchedMovieState extends State<SearchedMovie> {
  MovieSearchController m = Get.put(MovieSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181822),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "MovieSeries",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => m.isLoading.value
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(children: [
                  GridView.builder(
                    itemCount: m.movieList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(MovieDetails(), arguments: [
                            m.movieList[index].backdropPath.obs,
                            m.movieList[index].originalTitle.obs,
                            m.movieList[index].overview.obs,
                            m.movieList[index].voteAverage.obs,
                          ]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          // child: Image.network(
                          //   'https://image.tmdb.org/t/p/w185${m.movieList[index].posterPath}',
                          //   fit: BoxFit.none,
                          // ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w185${m.movieList[index].posterPath}',
                            fit: BoxFit.none,
                            placeholder: (context, url) =>
                                Image.asset('assets/place.png'),
                          ),
                        ),
                      );
                    },
                  ),
                ]),
              ),
      ),
    );
  }
}
