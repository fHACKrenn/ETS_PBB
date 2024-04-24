import 'package:flutter/material.dart';
import 'package:ets/src/pages/movie.dart';
import 'package:ets/src/database/movies_database.dart';
import 'package:ets/src/pages/movie_details.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Future<List<Movie>> movies;

  @override
  void initState() {
    super.initState();
    refreshMovieList();
  }

  refreshMovieList() {
    setState(() {
      movies = MovieDatabase.instance.getAllMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetail(movie: snapshot.data[index]),
                      ),
                    ).then((_) {
                      refreshMovieList();
                    });
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetail(),
            ),
          ).then((_) {
            refreshMovieList();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
