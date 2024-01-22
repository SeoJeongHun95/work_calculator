import 'package:auto_size_text/auto_size_text.dart';
import 'package:calander/features/Drawer/WorkGraph/work_graph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Drawer/Configure/presentation/view/app_setting_screen.dart';
import '../../../Drawer/Configure/presentation/view_model/app_setting_provider.dart';
import '../../data/models/work.dart';
import '../view_model/work_data_provider.dart';
import 'create_work_screen.dart';
import 'update_work_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime fDay = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime? sDay;
  double hour = 1.0;
  late Map<DateTime, List<Work>> workData;
  late List<Work> sWorks;
  late bool mealCheck;

  bool mealTimeCheck(double hour) {
    return hour >= 1.0 ? true : false;
  }

  List<Work> getWorksForDay(DateTime sDay) {
    return workData[sDay] ?? [];
  }

  double calcHour(double hour, double step) {
    return hour = double.parse((hour + step).toStringAsFixed(1)) >= 0
        ? double.parse((hour + step).toStringAsFixed(1))
        : 0.0;
  }

  Color textColor(DateTime day) {
    Color defaultTextColor = Theme.of(context).colorScheme.onBackground;

    if (day.weekday == DateTime.sunday) {
      return Colors.red;
    }
    if (day.weekday == DateTime.saturday) {
      return Colors.blue[600]!;
    }
    return defaultTextColor;
  }

  String weekdayStr(int weekday) {
    String weekdaystr = "";

    switch (weekday) {
      case 1:
        weekdaystr = "월";
        break;
      case 2:
        weekdaystr = "화";
        break;
      case 3:
        weekdaystr = "수";
        break;
      case 4:
        weekdaystr = "목";
        break;
      case 5:
        weekdaystr = "금";
        break;
      case 6:
        weekdaystr = "토";
        break;
      case 7:
        weekdaystr = "일";
        break;
    }
    return weekdaystr;
  }

  @override
  void initState() {
    setState(() {
      sDay = fDay;
      mealCheck = mealTimeCheck(hour);
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    var hourController = TextEditingController(text: "$hour");
    final appSetting = ref.watch(appSettingProvider);
    workData = ref.watch(workDataProvider);
    sWorks = getWorksForDay(sDay!);

    var drawerResult =
        ref.watch(workDataProvider.notifier).calcResult(appSetting.salaryDay!);

    Color getColorbyManHour(double manHour) {
      String colorStr = "0xff";

      if (manHour < 0.5) {
        colorStr += appSetting.color00!;
      } else if (manHour >= 0.5 && manHour < 1) {
        colorStr += appSetting.color05!;
      } else if (manHour >= 1 && manHour < 1.5) {
        colorStr += appSetting.color10!;
      } else if (manHour >= 1.5 && manHour < 2) {
        colorStr += appSetting.color15!;
      } else if (manHour >= 2) {
        colorStr += appSetting.color20!;
      }

      return Color(int.parse(colorStr));
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          shadowColor: Theme.of(context).colorScheme.shadow,
          child: ListView(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${appSetting.nickName}",
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.settings,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AppSettingScreen(
                                appSetting: appSetting,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("공수"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${drawerResult[0].toStringAsFixed(1)}"),
                          const Text(" 공수")
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.red,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("월급"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            MoneyFormatter(amount: drawerResult[1] * 1.0)
                                .output
                                .withoutFractionDigits,
                          ),
                          const Text(" 원")
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.red,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("식대"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            MoneyFormatter(amount: drawerResult[2] * 1.0)
                                .output
                                .withoutFractionDigits,
                          ),
                          const Text(" 원")
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.red,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("총합"),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            MoneyFormatter(
                                    amount: drawerResult[1] * 1.0 +
                                        drawerResult[2] * 1.0)
                                .output
                                .withoutFractionDigits,
                          ),
                          const Text(" 원")
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.red,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(64, 64),
                            padding: EdgeInsets.zero,
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const WorkGraph(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.auto_graph_rounded,
                            size: 32,
                          ),
                        ),
                        const Gap(8),
                        const Text("급여내역")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            Center(
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    sDay = DateTime.utc(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day);
                    fDay = sDay!;
                  });
                },
                icon: Icon(
                  Icons.today_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                label: Text(
                  "오늘",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton.icon(
                onPressed: () async {
                  var pickDate = await DatePicker.showSimpleDatePicker(
                    context,
                    firstDate: DateTime.utc(2023, 1, 1),
                    lastDate: DateTime.utc(2099, 12, 31),
                    initialDate: fDay,
                    dateFormat: "yyyy-MMMM-dd",
                    locale: DateTimePickerLocale.ko,
                    looping: true,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    textColor: Theme.of(context).colorScheme.onBackground,
                    titleText: "날짜 선택",
                    confirmText: "선택",
                    cancelText: "취소",
                    reverse: true,
                  );
                  setState(() {
                    sDay = DateTime.utc(
                        pickDate!.year, pickDate.month, pickDate.day);
                    fDay = sDay!;
                  });
                },
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                label: Text(
                  "날짜선택",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              // height: 400,
              child: TableCalendar(
                locale: "ko_KR",
                calendarFormat: MediaQuery.of(context).size.height > 600
                    ? CalendarFormat.month
                    : CalendarFormat.twoWeeks,
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2099, 12, 31),
                focusedDay: fDay,
                eventLoader: getWorksForDay,
                selectedDayPredicate: (day) {
                  return isSameDay(sDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(sDay, selectedDay)) {
                    setState(() {
                      sDay = selectedDay;
                      fDay = focusedDay;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  fDay = focusedDay;
                },
                calendarStyle: const CalendarStyle(
                  markersMaxCount: 2,
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, List<Work> events) {
                    double tot = 0.0;
                    for (var a in events) {
                      tot += a.manHour;
                    }

                    return tot == 0
                        ? null
                        : Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  "$tot 공수",
                                  style: TextStyle(
                                    overflow: TextOverflow.visible,
                                    color: getColorbyManHour(tot),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          );
                  },
                  defaultBuilder: (context, day, focusedDay) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        day.day.toString(),
                        style: TextStyle(
                          color: textColor(day),
                        ),
                      ),
                    );
                  },
                  dowBuilder: (context, day) {
                    return Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        weekdayStr(day.weekday),
                        style: TextStyle(color: textColor(day)),
                      ),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.7),
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.7),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day.day.toString(),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .inversePrimary
                              .withOpacity(0.7),
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.7),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day.day.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    hour = calcHour(hour, -0.5);
                                    mealCheck = mealTimeCheck(hour);
                                  });
                                },
                                icon: const Icon(
                                  Icons.keyboard_double_arrow_left_rounded,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    hour = calcHour(hour, -0.1);
                                    mealCheck = mealTimeCheck(hour);
                                  });
                                },
                                icon: const Icon(
                                  Icons.navigate_before_rounded,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    controller: hourController,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    hour = calcHour(hour, 0.1);
                                    mealCheck = mealTimeCheck(hour);
                                  });
                                },
                                icon: const Icon(
                                  Icons.navigate_next_rounded,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    hour = calcHour(hour, 0.5);
                                    mealCheck = mealTimeCheck(hour);
                                  });
                                },
                                icon: const Icon(
                                  Icons.keyboard_double_arrow_right_rounded,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    mealCheck = !mealCheck;
                                  });
                                },
                                icon: mealCheck
                                    ? Icon(
                                        Icons.check_box,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      )
                                    : Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                label: Text(
                                  "식대",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: () {
                                  showModalBottomSheet(
                                    useSafeArea: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) => CreateWorkScreen(
                                      sDay: sDay!,
                                      work: Work(
                                        genba: appSetting.genba!,
                                        manHour: hour,
                                        meals:
                                            mealCheck ? appSetting.meals! : 0,
                                        totSalary:
                                            (appSetting.oneDaySalary! * hour)
                                                .toInt(),
                                        memo: "",
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.comment,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                                label: Text(
                                  "상세추가",
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: FloatingActionButton(
                        heroTag: 0,
                        child: const Icon(Icons.add),
                        onPressed: () {
                          setState(
                            () {
                              if (hour > 0) {
                                ref.watch(workDataProvider.notifier).addWork(
                                      sDay!,
                                      Work(
                                        genba: appSetting.genba!,
                                        manHour: hour,
                                        meals:
                                            mealCheck ? appSetting.meals! : 0,
                                        totSalary:
                                            (appSetting.oneDaySalary! * hour)
                                                .toInt(),
                                        memo: "",
                                      ),
                                    );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${sDay.toString().substring(5, 7).split("-")[0]}월 ${sDay.toString().substring(8, 10)}일",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    workData.isEmpty
                        ? const Text(
                            "공수를 등록해주세요",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Divider(),
                              ),
                              itemCount: sWorks.length,
                              itemBuilder: (context, index) => Dismissible(
                                key: ValueKey(sWorks[index]),
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  color: Colors.red,
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Icon(Icons.delete_forever_rounded),
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                dismissThresholds: const {
                                  DismissDirection.endToStart: 0.3,
                                },
                                confirmDismiss: (direction) =>
                                    showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      content: const Text("삭제하시겠습니까?"),
                                      actions: [
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 1, child: Container()),
                                            Expanded(
                                              flex: 2,
                                              child: FloatingActionButton(
                                                mini: true,
                                                child: const Text("취소"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1, child: Container()),
                                            Expanded(
                                              flex: 2,
                                              child: FloatingActionButton(
                                                mini: true,
                                                child: const Text("삭제"),
                                                onPressed: () {
                                                  ref
                                                      .read(workDataProvider
                                                          .notifier)
                                                      .deleteWork(sDay!, index);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1, child: Container()),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                child: ListTile(
                                  onLongPress: () {
                                    showModalBottomSheet(
                                      useSafeArea: true,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) => UpdateWorkScreen(
                                        sDay: sDay!,
                                        work: Work(
                                          genba: sWorks[index].genba,
                                          manHour: sWorks[index].manHour,
                                          meals: sWorks[index].meals,
                                          totSalary: sWorks[index].totSalary,
                                          memo: sWorks[index].memo,
                                        ),
                                        index: index,
                                      ),
                                    );
                                  },
                                  title: Text(
                                    "${sWorks[index].genba}    ${sWorks[index].manHour} 공수",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  subtitle: sWorks[index].memo.isEmpty
                                      ? null
                                      : Text(
                                          sWorks[index].memo,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
