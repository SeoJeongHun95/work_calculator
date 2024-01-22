import 'package:hive/hive.dart';

import '../models/work.dart';

class WorkData {
  Future<Map<DateTime, List<Work>>?> fetchWorkData() async {
    Map<DateTime, List<Work>>? workMap = {};

    Map<dynamic, dynamic> tempMap = {};
    var getData = Hive.box("DataBox").get("workData");

    if (getData != null) {
      tempMap = getData;
    } else {
      return null;
    }

    tempMap.forEach((key, value) {
      if (key is DateTime && value is List<dynamic>) {
        List<Work> tmp = [];
        for (var a in value) {
          tmp.add(a as Work);
        }
        workMap[key] = tmp;
      }
    });

    return workMap;
  }
}
