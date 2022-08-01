import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';
import 'package:movieapp/service/dio_service.dart';
import 'package:movieapp/utils/apis.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(Duration(seconds: 3));

    var result = await _dioService.getDio().get(API.REQUET_MOVIE_LIST);

    return Movies.fromJson(result.data);
  }
}
