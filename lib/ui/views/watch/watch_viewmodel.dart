import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies/app/app.locator.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/repository_service.dart';
import 'package:stacked/stacked.dart';

class WatchViewModel extends ReactiveViewModel {
  final RepositoryService _repositoryService = locator<RepositoryService>();

  //Getters
  PagingController<int, Movie> get moviesPagingController =>
      _repositoryService.moviesPagingController;

  bool get showSearchBar => _repositoryService.showSearchBar;
  List<Genre> get allGenres => _repositoryService.allGenres;
  bool get isTyping => _repositoryService.isTyping;

  //Methods
  Future<void> refreshMovies() async {
    moviesPagingController.refresh();
  }

  Future<void> refreshSearch() async {
    moviesPagingController.refresh();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_repositoryService];
}
