import 'package:dark_forest/data/models/app_settings.dart';
import 'package:flutter/foundation.dart';

class AppSettingsState with ChangeNotifier {
  late AppSettingsModel _appSettings;

  AppSettingsModel get appSettings => _appSettings;

  setAppSettingsSilent(AppSettingsModel appSettings) {
    _appSettings = appSettings;
  }

  setAppSettings(AppSettingsModel appSettings) {
    _appSettings = appSettings;
    notifyListeners();
  }
}
