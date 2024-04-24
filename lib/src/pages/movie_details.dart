import 'package:flutter/material.dart';
import 'package:ets/src/pages/movie.dart';
import 'package:ets/src/database/movies_database.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;

  MovieDetail({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  TextEditingController _titleController;
  TextEditingController _posterUrlController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.movie?.title ?? '');
    _posterUrlController =
        TextEditingController(text: widget.movie?.posterUrl ?? '');
    _descriptionController =
        TextEditingController(text: widget.movie?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _posterUrlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movie == null ? 'Add Movie' : 'Edit Movie'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextField(
    controller: _titleController,
    decoration: InputDecoration(labelText: 'Title'),
    ),
    SizedBox(height: 12),
    TextField(
    controller: _posterUrlController,
    decoration: InputDecoration(labelText: 'Poster URL'),
    ),
    SizedBox(height: 12),
    TextField(
    controller: _descriptionController,

