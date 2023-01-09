import 'package:dark_forest/data/models/app_settings.dart';
import 'package:dark_forest/data/persistence/settings_db_saver.dart';
import 'package:dark_forest/domain/app_state/app_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsState>(builder: (_, settings, __) {
      return ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ListTile(
            title: const Text('Turn on dark mode'),
            subtitle: Text(
                'Currently : ${settings.appSettings.isDarkModeOn ? 'on' : 'off'}'),
            trailing: Switch(
              value: settings.appSettings.isDarkModeOn,
              onChanged: (bool value) {
                final newAppSettings = AppSettingsModel(
                    id: settings.appSettings.id, isDarkModeOn: value);
                SettingsDbSaver().setAppSettings(newAppSettings).then((res) {
                  if (res) {
                    settings.setAppSettings(newAppSettings);
                  }
                });
              },
            ),
          )
        ],
      );
    });
    ;
  }
}
