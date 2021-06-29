import 'package:BLoC_crashcourse/blocs/movies_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _bloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.fetchAllMovies();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: StreamBuilder(
          stream: _bloc.allMovies,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildList(AsyncSnapshot snapshot) {
    return GridView.builder(
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
              fit: BoxFit.cover);
        });
  }
}
