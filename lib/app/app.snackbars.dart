import 'package:flutter/material.dart';
import 'package:movies/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType {
  defaultBar,
  error,
  success,
}

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
  ));

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.defaultBar,
    config: SnackbarConfig(
      backgroundColor: Colors.black,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );
}
