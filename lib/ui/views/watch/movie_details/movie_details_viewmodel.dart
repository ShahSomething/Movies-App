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
  String? videoId;
  List<String>? images;

  bool _imagesLoading = false;

  //Getters
  List<Genre> get allGenres => _repositoryService.allGenres;
  bool get imagesLoading => _imagesLoading;

  set imagesLoading(bool value) {
    _imagesLoading = value;
    notifyListeners();
  }

  getMovieTrailer(int movieId) async {
    setBusy(true);
    videoId = await _repositoryService.fetchMovieTrailer(movieId);
    logger.i('Trailer Url: $videoId');
    setBusy(false);
  }

  getMovieImages(int movieId) async {
    imagesLoading = true;
    images = await _repositoryService.getMovieImages(movieId);
    imagesLoading = false;
  }
}
