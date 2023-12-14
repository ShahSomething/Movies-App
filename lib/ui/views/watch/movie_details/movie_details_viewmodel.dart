import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  //Services
  final RepositoryService _repositoryService = locator<RepositoryService>();
  final logger = getLogger('MovieDetailsViewModel');

  //Variables
  String? trailerUrl;

  //Getters
  List<Genre> get allGenres => _repositoryService.allGenres;

  getMovieTrailer(int movieId) async {
    setBusy(true);
    trailerUrl = await _repositoryService.fetchMovieTrailer(movieId);
    logger.i('Trailer Url: $trailerUrl');
    setBusy(false);
  }
}
