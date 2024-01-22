import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'work.freezed.dart';
part 'work.g.dart';

@freezed
@JsonSerializable()
class Work with _$Work {
  @HiveType(typeId: 1)
  const factory Work({
    @JsonKey(name: "genba") @HiveField(0) required String genba,
    @JsonKey(name: "manHour") @HiveField(1) required double manHour,
    @JsonKey(name: "totSalary") @HiveField(2) required int totSalary,
    @JsonKey(name: "meals") @HiveField(3) required int meals,
    @JsonKey(name: "memo") @HiveField(4) required String memo,
  }) = _Work;
}
