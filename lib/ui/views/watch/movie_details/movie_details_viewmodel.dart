import 'package:movies/app/app.locator.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  final RepositoryService _repositoryService = locator<RepositoryService>();

  List<Genre> get allGenres => _repositoryService.allGenres;
}
