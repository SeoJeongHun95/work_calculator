import 'package:hive/hive.dart';

import '../models/appsetting.dart';

class AppSettingData {
  Future<AppSetting?> fetchAppSettingData() async {
    AppSetting? appsetting;

    appsetting = Hive.box("DataBox").get("appsetting");

    return appsetting;
  }
}
