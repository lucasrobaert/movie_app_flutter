import 'package:dio/dio.dart';
import 'package:movieapp/service/dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
      "content-type": 'application/json;charset=utf-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZmYxNWY3ODFhOWU1NDM1Y2Y3YjA2NjBkNTkyZTk5OCIsInN1YiI6IjVmMjYyYTA2ZTE5NGIwMDAzNTkwZTRjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Bx4h8vnnOLLj9FIDFi5ySu8FvAZf638zgwB6g8CBfqQ'
    }));
  }
}
