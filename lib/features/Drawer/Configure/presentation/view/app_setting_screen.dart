import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/appsetting.dart';
import '../view_model/app_setting_provider.dart';

class AppSettingScreen extends ConsumerStatefulWidget {
  AppSettingScreen({super.key, required this.appSetting});

  AppSetting appSetting;

  @override
  ConsumerState<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends ConsumerState<AppSettingScreen> {
  late TextEditingController nickNameCtr;
  late TextEditingController genbaCtr;
  late TextEditingController oneDaySalaryCtr;
  late TextEditingController mealsCtr;
  late TextEditingController salaryDayCtr;

  late bool darkmodeTemp;
  late String seedColorTemp;
  late String color00Temp;
  late String color05Temp;
  late String color10Temp;
  late String color15Temp;
  late String color20Temp;

  @override
  void initState() {
    nickNameCtr = TextEditingController(text: widget.appSetting.nickName);
    genbaCtr = TextEditingController(text: widget.appSetting.genba);
    oneDaySalaryCtr =
        TextEditingController(text: widget.appSetting.oneDaySalary.toString());
    mealsCtr = TextEditingController(text: widget.appSetting.meals.toString());
    salaryDayCtr =
        TextEditingController(text: widget.appSetting.salaryDay.toString());
    darkmodeTemp = widget.appSetting.darkMode!;
    seedColorTemp = widget.appSetting.seedColor!;
    color00Temp = widget.appSetting.color00!;
    color05Temp = widget.appSetting.color05!;
    color10Temp = widget.appSetting.color10!;
    color15Temp = widget.appSetting.color15!;
    color20Temp = widget.appSetting.color20!;
    super.initState();
  }

  @override
  void dispose() {
    nickNameCtr.dispose();
    genbaCtr.dispose();
    oneDaySalaryCtr.dispose();
    mealsCtr.dispose();
    salaryDayCtr.dispose();
    super.dispose();
  }

  void changeseedColor(Color newColor) {
    setState(() {
      seedColorTemp = newColor.toString().substring(10, 16);
    });
  }

  void change00Color(Color newColor) {
    setState(() {
      color00Temp = newColor.toString().substring(10, 16);
    });
  }

  void change05Color(Color newColor) {
    setState(() {
      color05Temp = newColor.toString().substring(10, 16);
    });
  }

  void change10Color(Color newColor) {
    setState(() {
      color10Temp = newColor.toString().substring(10, 16);
    });
  }

  void change15Color(Color newColor) {
    setState(() {
      color15Temp = newColor.toString().substring(10, 16);
    });
  }

  void change20Color(Color newColor) {
    setState(() {
      color20Temp = newColor.toString().substring(10, 16);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("설정"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: "닉네임",
                              border: OutlineInputBorder(),
                            ),
                            controller: nickNameCtr,
                            maxLength: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.business_rounded),
                              labelText: "회사",
                              border: OutlineInputBorder(),
                            ),
                            controller: genbaCtr,
                            maxLength: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.wallet),
                              labelText: "단가",
                              border: OutlineInputBorder(),
                            ),
                            controller: oneDaySalaryCtr,
                            maxLength: 30,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+$'))
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.fastfood_rounded),
                              labelText: "식대",
                              border: OutlineInputBorder(),
                            ),
                            controller: mealsCtr,
                            maxLength: 30,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+$'))
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_month_rounded),
                              labelText: "월급기준일",
                              border: OutlineInputBorder(),
                            ),
                            controller: salaryDayCtr,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^(0?[1-9]|[12][0-9]|3[01])$'))
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SwitchListTile(
                          value: darkmodeTemp,
                          title: const Text(
                            "다크모드",
                            style: TextStyle(fontSize: 14),
                          ),
                          onChanged: (value) {
                            setState(() {
                              darkmodeTemp = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "테마컬러",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 30,
                                  color: Color(int.parse("0xff$seedColorTemp")),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("색상선택"),
                                          content: MaterialPicker(
                                            pickerColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onColorChanged: (value) {
                                              changeseedColor(
                                                value,
                                              );
                                              Navigator.pop(context);
                                            },
                                            portraitOnly: true,
                                            enableLabel: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: Text(
                                    "색상선택",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.color_lens_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "~ 0.5 공수",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 30,
                                  color: Color(int.parse("0xff$color00Temp")),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("색상선택"),
                                          content: MaterialPicker(
                                            pickerColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onColorChanged: (value) {
                                              change00Color(
                                                value,
                                              );
                                              Navigator.pop(context);
                                            },
                                            portraitOnly: true,
                                            enableLabel: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: Text(
                                    "색상선택",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.color_lens_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "~ 1.0 공수",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 30,
                                  color: Color(int.parse("0xff$color05Temp")),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("색상선택"),
                                          content: MaterialPicker(
                                            pickerColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onColorChanged: (value) {
                                              change05Color(
                                                value,
                                              );
                                              Navigator.pop(context);
                                            },
                                            portraitOnly: true,
                                            enableLabel: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: Text(
                                    "색상선택",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.color_lens_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "~ 1.5 공수",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 30,
                                  color: Color(int.parse("0xff$color10Temp")),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("색상선택"),
                                          content: MaterialPicker(
                                            pickerColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onColorChanged: (value) {
                                              change10Color(
                                                value,
                                              );
                                              Navigator.pop(context);
                                            },
                                            portraitOnly: true,
                                            enableLabel: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: Text(
                                    "색상선택",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.color_lens_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "~ 2.0 공수",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 30,
                                  color: Color(int.parse("0xff$color15Temp")),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("색상선택"),
                                          content: MaterialPicker(
                                            pickerColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onColorChanged: (value) {
                                              change15Color(
                                                value,
                                              );
                                              Navigator.pop(context);
                                            },
                                            portraitOnly: true,
                                            enableLabel: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: Text(
                                    "색상선택",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.color_lens_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "2.0 ~ 공수",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 30,
                                  color: Color(int.parse("0xff$color20Temp")),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("색상선택"),
                                          content: MaterialPicker(
                                            pickerColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onColorChanged: (value) {
                                              change20Color(
                                                value,
                                              );
                                              Navigator.pop(context);
                                            },
                                            portraitOnly: true,
                                            enableLabel: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  label: Text(
                                    "색상선택",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.color_lens_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              darkmodeTemp = true;
                              seedColorTemp = "673AB7";
                              color00Temp = "2196F3";
                              color05Temp = "4CAF50";
                              color10Temp = "FFEB3B";
                              color15Temp = "FF9800";
                              color20Temp = "F44336";
                            });
                          },
                          icon: Icon(
                            Icons.restore_rounded,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          label: Text(
                            "초기설정으로",
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 1,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("취소"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 2,
                  onPressed: () {
                    ref.read(appSettingProvider.notifier).updateAppSetting(
                          AppSetting(
                            nickName: nickNameCtr.text,
                            genba: genbaCtr.text,
                            oneDaySalary: int.parse(oneDaySalaryCtr.text),
                            meals: int.parse(mealsCtr.text),
                            salaryDay: int.parse(salaryDayCtr.text),
                            color00: color00Temp,
                            color05: color05Temp,
                            color10: color10Temp,
                            color15: color15Temp,
                            color20: color20Temp,
                            darkMode: darkmodeTemp,
                            seedColor: seedColorTemp,
                          ),
                        );
                    Navigator.of(context).pop();
                  },
                  child: const Text("적용"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
