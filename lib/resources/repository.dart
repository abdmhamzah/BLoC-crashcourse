import 'dart:async';
import 'package:BLoC_crashcourse/models/movie_item_model.dart';
import 'package:BLoC_crashcourse/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
