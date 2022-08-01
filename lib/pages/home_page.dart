import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/decorators/movies_cache_repository_decorator.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import 'package:movieapp/service/dio_service_imp.dart';
import 'package:movieapp/utils/apis.utils.dart';
import 'package:movieapp/widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImp(
        DioServiceImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      children: [
                        Text('Movies',
                            style: Theme.of(context).textTheme.headline2),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: _controller.onChange,
                        )
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movies.listMovies.length,
                            itemBuilder: (_, idx) => CustomListCardWidget(
                                movie: movies.listMovies[idx]),
                            separatorBuilder: (_, __) => const Divider(),
                          )
                        : Lottie.asset('assets/lottie.json');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
