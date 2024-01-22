import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Drawer/Configure/presentation/view_model/app_setting_provider.dart';
import '../../data/models/work.dart';
import '../view_model/work_data_provider.dart';

class CreateWorkScreen extends ConsumerStatefulWidget {
  CreateWorkScreen({super.key, required this.sDay, required this.work});

  DateTime sDay;
  Work work;

  @override
  ConsumerState<CreateWorkScreen> createState() => _CreateWorkScreenState();
}

class _CreateWorkScreenState extends ConsumerState<CreateWorkScreen> {
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.sDay.toString().substring(5, 7).split("-")[0]}월 ${widget.sDay.toString().substring(8, 10)}일",
          ),
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
                        keyboardType:
                            const TextInputType.numberWithOptions(signed: true),
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
                            ref.read(workDataProvider.notifier).addWork(
                                  widget.sDay,
                                  Work(
                                    genba: genbaCtr.text,
                                    manHour: double.parse(manHourCtr.text),
                                    totSalary: (double.parse(manHourCtr.text) *
                                            appSetting.oneDaySalary!)
                                        .toInt(),
                                    meals: appSetting.meals!,
                                    memo: memoCtr.text,
                                  ),
                                );
                            Navigator.of(context).pop();
                          },
                          label: const Text("추가"),
                        ),
                      ),
                    )
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
