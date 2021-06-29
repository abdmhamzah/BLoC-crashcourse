import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:BLoC_crashcourse/models/movie_item_model.dart';

class MovieApiProvider {
  Client client = Client();
  static String _apiKey = '37bf84ad84458455941f0d3a92b70484';
  String url = "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey";

  Future<MovieItemModel> fetchMovieList() async {
    print('entered');
    final response = await client.get(url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Movie List');
    }
  }
}
