// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart' as _i10;
import 'package:movies/ui/views/navigation/navigation_view.dart' as _i3;
import 'package:movies/ui/views/search/search_view.dart' as _i8;
import 'package:movies/ui/views/startup/startup_view.dart' as _i2;
import 'package:movies/ui/views/trailer/trailer_view.dart' as _i7;
import 'package:movies/ui/views/under_construction/under_construction_view.dart'
    as _i5;
import 'package:movies/ui/views/watch/movie_details/movie_details_view.dart'
    as _i6;
import 'package:movies/ui/views/watch/watch_view.dart' as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const startupView = '/startup-view';

  static const navigationView = '/navigation-view';

  static const watchView = '/watch-view';

  static const underConstructionView = '/under-construction-view';

  static const movieDetailsView = '/movie-details-view';

  static const trailerView = '/trailer-view';

  static const searchView = '/search-view';

  static const all = <String>{
    startupView,
    navigationView,
    watchView,
    underConstructionView,
    movieDetailsView,
    trailerView,
    searchView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.navigationView,
      page: _i3.NavigationView,
    ),
    _i1.RouteDef(
      Routes.watchView,
      page: _i4.WatchView,
    ),
    _i1.RouteDef(
      Routes.underConstructionView,
      page: _i5.UnderConstructionView,
    ),
    _i1.RouteDef(
      Routes.movieDetailsView,
      page: _i6.MovieDetailsView,
    ),
    _i1.RouteDef(
      Routes.trailerView,
      page: _i7.TrailerView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i8.SearchView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.NavigationView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.NavigationView(),
        settings: data,
      );
    },
    _i4.WatchView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.WatchView(),
        settings: data,
      );
    },
    _i5.UnderConstructionView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.UnderConstructionView(),
        settings: data,
      );
    },
    _i6.MovieDetailsView: (data) {
      final args = data.getArgs<MovieDetailsViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.MovieDetailsView(args.movie, key: args.key),
        settings: data,
      );
    },
    _i7.TrailerView: (data) {
      final args = data.getArgs<TrailerViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.TrailerView(args.trailerUrl, key: args.key),
        settings: data,
      );
    },
    _i8.SearchView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SearchView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MovieDetailsViewArguments {
  const MovieDetailsViewArguments({
    required this.movie,
    this.key,
  });

  final _i10.Movie movie;

  final _i9.Key? key;

  @override
  String toString() {
    return '{"movie": "$movie", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MovieDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.movie == movie && other.key == key;
  }

  @override
  int get hashCode {
    return movie.hashCode ^ key.hashCode;
  }
}

class TrailerViewArguments {
  const TrailerViewArguments({
    required this.trailerUrl,
    this.key,
  });

  final String trailerUrl;

  final _i9.Key? key;

  @override
  String toString() {
    return '{"trailerUrl": "$trailerUrl", "key": "$key"}';
  }

  @override
  bool operator ==(covariant TrailerViewArguments other) {
    if (identical(this, other)) return true;
    return other.trailerUrl == trailerUrl && other.key == key;
  }

  @override
  int get hashCode {
    return trailerUrl.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.navigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWatchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.watchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUnderConstructionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.underConstructionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMovieDetailsView({
    required _i10.Movie movie,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.movieDetailsView,
        arguments: MovieDetailsViewArguments(movie: movie, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrailerView({
    required String trailerUrl,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.trailerView,
        arguments: TrailerViewArguments(trailerUrl: trailerUrl, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.navigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWatchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.watchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUnderConstructionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.underConstructionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMovieDetailsView({
    required _i10.Movie movie,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.movieDetailsView,
        arguments: MovieDetailsViewArguments(movie: movie, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrailerView({
    required String trailerUrl,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.trailerView,
        arguments: TrailerViewArguments(trailerUrl: trailerUrl, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
