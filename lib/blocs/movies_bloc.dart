import 'package:BLoC_crashcourse/models/movie_item_model.dart';
import 'package:BLoC_crashcourse/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieItemModel>();

  Observable<MovieItemModel> get allMovies => _moviesFetcher.stream;

  void fetchAllMovies() async {
    MovieItemModel movieItemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(movieItemModel);
  }

  void dispose() {
    _moviesFetcher.close();
  }
}
