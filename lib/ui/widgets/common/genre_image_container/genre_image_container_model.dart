import 'dart:math';

import 'package:movies/app/app.locator.dart';
import 'package:movies/app/app.logger.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/ui/common/api_endpoints.dart';
import 'package:movies/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class GenreImageContainerModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final logger = getLogger('GenreImageContainerModel');

  String? genreImageUrl;

  fetchGenreImage(Genre genre) async {
    setBusy(true);
    try {
      var response = await _apiService.get(
          endPoint: ApiEndPoints.discover,
          params: {
            'with_genres': genre.name,
            'sort_by': 'popularity.desc',
            'page': 1
          });
      if (response != null) {
        var result = response.data['results'];
        var imagePath =
            result[Random().nextInt(result.length)]['backdrop_path'];
        genreImageUrl = imagesBaseUrl + imagePath;
      }
    } catch (e) {
      logger.e(e);
    } finally {
      setBusy(false);
    }
  }
}
