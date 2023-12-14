import 'package:movies/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:movies/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:movies/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:movies/ui/views/navigation/navigation_view.dart';
import 'package:movies/ui/views/watch/watch_view.dart';
import 'package:movies/ui/views/under_construction/under_construction_view.dart';
import 'package:movies/ui/views/watch/movie_details/movie_details_view.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/services/repository_service.dart';
import 'package:movies/ui/views/trailer/trailer_view.dart';
import 'package:movies/ui/views/search/search_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: NavigationView),
    MaterialRoute(page: WatchView),
    MaterialRoute(page: UnderConstructionView),
    MaterialRoute(page: MovieDetailsView),
    MaterialRoute(page: TrailerView),
    MaterialRoute(page: SearchView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: RepositoryService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
