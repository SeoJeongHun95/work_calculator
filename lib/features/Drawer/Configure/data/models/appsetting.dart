import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'appsetting.freezed.dart';
part 'appsetting.g.dart';

@freezed
@JsonSerializable()
class AppSetting with _$AppSetting {
  @HiveType(typeId: 0)
  const factory AppSetting({
    @JsonKey(name: "nickName") @HiveField(0) String? nickName,
    @JsonKey(name: "genba") @HiveField(1) String? genba,
    @JsonKey(name: "oneDaySalary") @HiveField(2) int? oneDaySalary,
    @JsonKey(name: "meals") @HiveField(3) int? meals,
    @JsonKey(name: "salaryDay") @HiveField(4) int? salaryDay,
    @JsonKey(name: "color00") @HiveField(5) String? color00,
    @JsonKey(name: "color05") @HiveField(6) String? color05,
    @JsonKey(name: "color10") @HiveField(7) String? color10,
    @JsonKey(name: "color15") @HiveField(8) String? color15,
    @JsonKey(name: "color20") @HiveField(9) String? color20,
    @JsonKey(name: "seedColor") @HiveField(10) String? seedColor,
    @JsonKey(name: "darkMode") @HiveField(11) bool? darkMode,
  }) = _AppSetting;
}
