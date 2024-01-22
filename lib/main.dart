import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'features/Drawer/Configure/data/models/appsetting.dart';
import 'features/Drawer/Configure/presentation/view_model/app_setting_provider.dart';
import 'features/Home/data/models/work.dart';
import 'features/Home/home.dart';
import 'features/Home/presentation/view_model/work_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  initializeDateFormatting();

  await Hive.initFlutter();

  const secureStorage = FlutterSecureStorage();
  // if key not exists return null
  final encryptionKeyString = await secureStorage.read(key: 'key');
  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: 'key');
  final encryptionKeyUint8List = base64Url.decode(key!);

  Hive.registerAdapter(WorkImplAdapter());
  Hive.registerAdapter(AppSettingImplAdapter());

  await Hive.openBox('DataBox',
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appSettingProvider.notifier).getAppSettingData();
    ref.read(workDataProvider.notifier).getWorkgData();

    var appSetting = ref.watch(appSettingProvider);

    String seedColor = "0xff${appSetting.seedColor}";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(int.parse(seedColor)),
          brightness: appSetting.darkMode! ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
