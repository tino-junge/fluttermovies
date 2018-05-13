import 'package:flutter/material.dart';
import 'models.dart';
import 'movie_api.dart';
import 'movie_details_page.dart';

class MovieListPage extends StatefulWidget {
  MovieListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MovieListPageState createState() => new _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> _movies = <Movie>[];

  @override
  void initState() {
    super.initState();
    listenForMovies();
  }

  listenForMovies() async {
    var stream = await getMovies();
    stream.listen((movie) => setState(() => _movies.add(movie)));
  }

  removeMovie(movie) {
    _movies.removeLast();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Recent movies'),
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            final _movie = _movies[index];

            return new Dismissible(
                key: new Key(_movie.title),
                background: new Container(color: Colors.green),
                secondaryBackground: new Container(color: Colors.red),
                onDismissed: (direction) {
                  _movies.removeAt(index);
                  direction == DismissDirection.endToStart
                      ? showToast('Dismissed!', context)
                      : showToast('Favourite!', context);
                },
                child: new ListTile(
                    title: new Text(_movie.title),
                    subtitle: new Text('Rating: ' + _movie.rating.toString(),
                        style: _movie.rating > 6
                            ? new TextStyle(color: Colors.green)
                            : new TextStyle(color: Colors.red)),
                    leading: new CircleAvatar(
                        backgroundImage: new NetworkImage(_movie.posterUrl)),
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MovieDetailsPage(_movie)),
                      );
                    }));
          },
        ),
      ),
    );
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast(
    text, context) {
  return Scaffold
      .of(context)
      .showSnackBar(new SnackBar(content: new Text(text)));
}
