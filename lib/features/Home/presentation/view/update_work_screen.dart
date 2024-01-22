import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Drawer/Configure/presentation/view_model/app_setting_provider.dart';
import '../../data/models/work.dart';
import '../view_model/work_data_provider.dart';

class UpdateWorkScreen extends ConsumerStatefulWidget {
  UpdateWorkScreen(
      {super.key, required this.sDay, required this.work, required this.index});

  DateTime sDay;
  Work work;
  int index;

  @override
  ConsumerState<UpdateWorkScreen> createState() => _UpdateWorkScreenState();
}

class _UpdateWorkScreenState extends ConsumerState<UpdateWorkScreen> {
  var genbaCtr;
  var manHourCtr;
  var mealsCtr;
  var memoCtr;

  @override
  void initState() {
    genbaCtr = TextEditingController(text: widget.work.genba);
    manHourCtr = TextEditingController(text: widget.work.manHour.toString());
    mealsCtr = TextEditingController(text: widget.work.meals.toString());
    memoCtr = TextEditingController(text: widget.work.memo);
    super.initState();
  }

  @override
  void dispose() {
    manHourCtr.dispose();
    mealsCtr.dispose();
    memoCtr.dispose();
    genbaCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSetting = ref.watch(appSettingProvider);

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.sDay.toString().substring(5, 7).split("-")[0]}월 ${widget.sDay.toString().substring(8, 10)}일",
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    content: const Text("삭제하시겠습니까?"),
                    actions: [
                      Row(
                        children: [
                          Expanded(flex: 1, child: Container()),
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
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                            flex: 2,
                            child: FloatingActionButton(
                              mini: true,
                              child: const Text("삭제"),
                              onPressed: () {
                                ref
                                    .read(workDataProvider.notifier)
                                    .deleteWork(widget.sDay, widget.index);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Expanded(flex: 1, child: Container()),
                        ],
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.delete_forever,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              label: Text(
                "삭제",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "현장",
                    border: OutlineInputBorder(),
                  ),
                  controller: genbaCtr,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "공수",
                          border: OutlineInputBorder(),
                        ),
                        controller: manHourCtr,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+(\.\d{0,1})?$'))
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "식대",
                          border: OutlineInputBorder(),
                        ),
                        controller: mealsCtr,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+$'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "메모",
                    border: OutlineInputBorder(),
                  ),
                  controller: memoCtr,
                  autofocus: false,
                  maxLines: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          label: const Text("취소"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            ref.read(workDataProvider.notifier).updateWork(
                                  widget.sDay,
                                  Work(
                                    genba: genbaCtr.text,
                                    manHour: double.parse(manHourCtr.text),
                                    totSalary: (double.parse(manHourCtr.text) *
                                            appSetting.oneDaySalary!)
                                        .toInt(),
                                    meals: int.parse(mealsCtr.text),
                                    memo: memoCtr.text,
                                  ),
                                  widget.index,
                                );
                            Navigator.of(context).pop();
                          },
                          label: const Text("수정"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
