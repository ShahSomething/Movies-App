import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/app/app.snackbars.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/ui/common/api_endpoints.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RepositoryService with ListenableServiceMixin {
  RepositoryService() {
    fetchUpcomingMoviesPage(1);
    fetchAllGenres();
    resetMoviesPagingController();

    listenToReactiveValues([
      _showSearchBar,
      _allGenres,
      _isTyping,
      _searchedMovies,
      _isSearchLoading
    ]);
  }
  //Services
  final ApiService _apiService = locator<ApiService>();
  final _logger = getLogger("RepositoryService");
  final SnackbarService _snackbarService = locator<SnackbarService>();

  //Variables
  final List<Genre> _allGenres = [];
  bool _showSearchBar = false;
  bool _isTyping = false;
  List<Movie> _searchedMovies = [];
  bool _isSearchLoading = false;

  //Getters
  bool get showSearchBar => _showSearchBar;
  List<Genre> get allGenres => _allGenres;
  bool get isTyping => _isTyping;
  List<Movie> get searchedMovies => _searchedMovies;
  bool get isSearchLoading => _isSearchLoading;

  //Setters
  set showSearchBar(bool value) {
    _showSearchBar = value;
    notifyListeners();
  }

  set searchedMovies(List<Movie> movies) {
    _searchedMovies = movies;
    notifyListeners();
  }

  set isTyping(bool value) {
    _isTyping = value;
    notifyListeners();
  }

  set isSearchLoading(bool value) {
    _isSearchLoading = value;
    notifyListeners();
  }

  //Controllers
  final PagingController<int, Movie> moviesPagingController =
      PagingController<int, Movie>(firstPageKey: 1);

  //Methods
  fetchUpcomingMoviesPage(int page) async {
    final response = await _apiService
        .get(endPoint: ApiEndPoints.upcomingMovies, params: {"page": page});
    if (response != null) {
      List<Movie> newMovies = [];
      int totalPages = response.data['total_pages'];
      response.data['results'].forEach((movie) {
        newMovies.add(Movie.fromMap(movie));
      });
      final isLastPage = page == totalPages;

      if (isLastPage) {
        moviesPagingController.appendLastPage(newMovies);
      } else {
        final nextPageKey = page + 1;
        moviesPagingController.appendPage(newMovies, nextPageKey);
      }
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch movies",
        variant: SnackbarType.error,
      );
    }
  }

  fetchAllGenres() async {
    final response = await _apiService.get(endPoint: ApiEndPoints.genreList);
    if (response != null) {
      response.data['genres'].forEach((genre) {
        _allGenres.add(Genre.fromMap(genre));
      });
      notifyListeners();
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch genres",
        variant: SnackbarType.error,
      );
    }
  }

  Future<String?> fetchMovieTrailer(int movieId) async {
    final response = await _apiService.get(
      endPoint: "movie/$movieId/videos",
    );
    if (response != null) {
      if (response.data['results'].length > 0) {
        var trailerKey = response.data['results'][0]['key'];
        return trailerKey;
      } else {
        _snackbarService.showCustomSnackBar(
          message: "No trailer found",
          variant: SnackbarType.error,
        );
        return null;
      }
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch movie trailer",
        variant: SnackbarType.error,
      );
      return null;
    }
  }

  searchMovies(String query) {
    isSearchLoading = true;
    _fetchSearchedMoviesPage(1, query);
  }

  _fetchSearchedMoviesPage(int page, String query) async {
    final response = await _apiService.get(
        endPoint: ApiEndPoints.search,
        params: {"page": page, "query": query, "language": "en-US"});
    if (response != null) {
      List<Movie> newMovies = [];
      response.data['results'].forEach((movie) {
        newMovies.add(Movie.fromMap(movie));
      });
      searchedMovies = newMovies;
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch movies",
        variant: SnackbarType.error,
      );
    }
    isSearchLoading = false;
  }

  resetMoviesPagingController() {
    moviesPagingController.addPageRequestListener((pageKey) {
      fetchUpcomingMoviesPage(pageKey);
    });
    moviesPagingController.refresh();
  }

  dispose() {
    moviesPagingController.dispose();
  }
}
