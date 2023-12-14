import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class WatchViewModel extends BaseViewModel {
  final RepositoryService _repositoryService = locator<RepositoryService>();

  //Getters
  PagingController<int, Movie> get moviesPagingController =>
      _repositoryService.moviesPagingController;

  //Methods
  Future<void> refreshMovies() async {
    moviesPagingController.refresh();
  }
}
