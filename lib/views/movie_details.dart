import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieseries/controller/movies_controller.dart';

class MovieDetails extends StatelessWidget {
  MovieController m = Get.put(MovieController());
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
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w185${Get.arguments[0].toString()}',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  Get.arguments[1].toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Get.arguments[2].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 8),
                    Text(
                      Get.arguments[3].toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
