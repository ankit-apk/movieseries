import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieseries/views/movies_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MoviesView(),
    );
  }
}

// class Movies extends StatefulWidget {
//   @override
//   _MoviesState createState() => _MoviesState();
// }

// class _MoviesState extends State<Movies> {
//   var result2;
//   void getData() async {
//     http.Response response = await http.get(
//       Uri.parse(
//           "https://api.themoviedb.org/3/movie/popular?api_key=106aeb67d3c86a97bb7a549b6b21c73f&language=en-US"),
//     );
//     if (response.statusCode == 200) {
//       setState(() {
//         result2 = jsonDecode(response.body);
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   void empty() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: result2 == null
//             ? Container(
//                 child: Center(
//                   child: CircularProgressIndicator(
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//               )
//             : GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
//                 itemCount: result2['results'].length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return Image.network(
//                     'https://image.tmdb.org/t/p/w185${result2['results'][index]['poster_path']}',
//                     fit: BoxFit.fill,
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
