import 'package:flutter/cupertino.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  onChange(String value) {
    var list = _cachedMovies!.listMovies
        .where(
          (e) => e.toString().toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
