import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../data/datasources/app_setting_data.dart';
import '../../data/models/appsetting.dart';

final appSettingProvider =
    StateNotifierProvider<AppSettingNotifier, AppSetting>(
  (ref) => AppSettingNotifier(),
);

class AppSettingNotifier extends StateNotifier<AppSetting> {
  AppSettingNotifier()
      : super(
          const AppSetting(
            nickName: "User",
            genba: "○○건설",
            meals: 0,
            oneDaySalary: 0,
            salaryDay: 1,
            color00: "2196F3",
            color05: "4CAF50",
            color10: "FFEB3B",
            color15: "FF9800",
            color20: "F44336",
            seedColor: "673AB7",
            darkMode: true,
          ),
        );

  void getAppSettingData() async {
    AppSetting? tmp = await AppSettingData().fetchAppSettingData();
    if (tmp != null) {
      state = tmp;
    }
  }

  void updateAppSetting(AppSetting appSetting) {
    state = appSetting;
    Hive.box("DataBox").put("appsetting", state);
  }
}
