import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieseries/controller/movies_controller.dart';

import 'movie_search_details.dart';

class MovieSearch extends StatefulWidget {
  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  var query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "MovieSeries",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                onChanged: (newValue) {
                  setState(() {
                    query = newValue;
                  });
                },
                autofocus: true,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.movie, color: Colors.white),
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Search a title",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 22),
                )),
            ElevatedButton(
              onPressed: () {
                Get.to(SearchedMovie(), arguments: query);
              },
              child: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
