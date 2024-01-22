import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../data/datasources/work_data.dart';
import '../../data/models/work.dart';

final workDataProvider =
    StateNotifierProvider<WorkDataNotifier, Map<DateTime, List<Work>>>(
  (ref) => WorkDataNotifier(),
);

class WorkDataNotifier extends StateNotifier<Map<DateTime, List<Work>>> {
  WorkDataNotifier() : super({});

  void getWorkgData() async {
    Map<DateTime, List<Work>>? tmp = await WorkData().fetchWorkData();
    if (tmp != null) {
      state = tmp;
    }
  }

  void addWork(DateTime sDay, Work work) {
    if (state[sDay] == null) {
      state = {
        ...state,
        sDay: [work]
      };
    } else {
      state = {
        ...state,
        sDay: [...state[sDay]!, work]
      };
    }
    Hive.box("DataBox").put("workData", state);
  }

  void updateWork(DateTime sDay, Work work, int index) {
    List<Work> replaceWorkList = state[sDay]!;
    replaceWorkList.insert(index, work);
    replaceWorkList.removeAt(index + 1);

    state = {...state, sDay: replaceWorkList};
    Hive.box("DataBox").put("workData", state);
  }

  void deleteWork(DateTime sDay, int index) {
    List<Work> replaceWorkList = state[sDay]!;
    replaceWorkList.removeAt(index);

    state = {...state, sDay: replaceWorkList};
    Hive.box("DataBox").put("workData", state);
  }

  List<dynamic> calcResult(int salaryDay) {
    double totHour = 0.0;
    int totSalary = 0;
    int totMeals = 0;

    var currMonth =
        DateTime.utc(DateTime.now().year, DateTime.now().month, salaryDay);
    var afterMonth = DateTime.utc(
        DateTime.now().year, DateTime.now().month + 1, salaryDay - 1);

    final length = afterMonth.difference(currMonth).inDays;

    for (var a = 0; a <= length; a++) {
      if (state[currMonth.add(Duration(days: a))] != null) {
        List<Work> tmpList = state[currMonth.add(Duration(days: a))]!;
        for (var b in tmpList) {
          totHour += b.manHour;
          totSalary += b.totSalary;
          totMeals += b.meals;
        }
      }
    }
    return [totHour, totSalary, totMeals];
  }
}
