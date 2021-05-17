import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieseries/controller/movies_controller.dart';
import 'package:movieseries/views/movie_details.dart';
import 'package:movieseries/views/movie_search.dart';

class MoviesView extends StatelessWidget {
  MovieController m = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff181822),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home, size: 35, color: Colors.white),
              GestureDetector(
                  onTap: () {
                    Get.to(MovieSearch());
                  },
                  child: Icon(Icons.search, size: 35, color: Colors.white)),
              Icon(Icons.account_balance, size: 35, color: Colors.white),
            ],
          ),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     "MovieSeries",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        body: SafeArea(
          child: Obx(
            () => m.isLoading.value == true
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(children: [
                      Text(
                        "Trending Movies",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        height: 28,
                      ),
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
        ));
  }
}
