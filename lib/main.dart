import 'package:dark_forest/data/models/app_settings.dart';
import 'package:dark_forest/data/persistence/settings_db_saver.dart';
import 'package:dark_forest/domain/app_state/app_settings_state.dart';
import 'package:dark_forest/domain/app_state/game_state.dart';
import 'package:dark_forest/ui/app_theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/routes/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appSettings = await SettingsDbSaver().getAppSettings();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AppSettingsState(),
      ),
      ChangeNotifierProvider(
        create: (_) => GameState(),
      ),
    ],
    child: DarkForest(
      appSettings: appSettings,
    ),
  ));
}

class DarkForest extends StatefulWidget {
  const DarkForest({Key? key, required this.appSettings}) : super(key: key);

  final AppSettingsModel appSettings;

  @override
  State<DarkForest> createState() => _DarkForestState();
}

class _DarkForestState extends State<DarkForest> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppSettingsState>(context, listen: false)
        .setAppSettingsSilent(widget.appSettings);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dark Forest',
      routerConfig: routerConfig,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Quicksand',
          colorScheme: Provider.of<AppSettingsState>(
            context,
          ).appSettings.isDarkModeOn
              ? darkColorScheme
              : lightColorScheme),
    );
  }
}
