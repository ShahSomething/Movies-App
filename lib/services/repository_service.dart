import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/app/app.snackbars.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/ui/common/api_endpoints.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked_services/stacked_services.dart';

class RepositoryService {
  RepositoryService() {
    fetchUpcomingMoviesPage(1);
    fetchAllGenres();
    moviesPagingController.addPageRequestListener((pageKey) {
      fetchUpcomingMoviesPage(pageKey);
    });
  }
  //Services
  final ApiService _apiService = locator<ApiService>();
  final _logger = getLogger("RepositoryService");
  final SnackbarService _snackbarService = locator<SnackbarService>();

  //Variables
  List<Genre> allGenres = [];

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
        allGenres.add(Genre.fromMap(genre));
      });
    } else {
      _logger.wtf("Response is null");
      _snackbarService.showCustomSnackBar(
        message: "Couldn't fetch genres",
        variant: SnackbarType.error,
      );
    }
  }

  dispose() {
    moviesPagingController.dispose();
  }
}
