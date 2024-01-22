// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appsetting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingImplAdapter extends TypeAdapter<_$AppSettingImpl> {
  @override
  final int typeId = 0;

  @override
  _$AppSettingImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AppSettingImpl(
      nickName: fields[0] as String?,
      genba: fields[1] as String?,
      oneDaySalary: fields[2] as int?,
      meals: fields[3] as int?,
      salaryDay: fields[4] as int?,
      color00: fields[5] as String?,
      color05: fields[6] as String?,
      color10: fields[7] as String?,
      color15: fields[8] as String?,
      color20: fields[9] as String?,
      seedColor: fields[10] as String?,
      darkMode: fields[11] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, _$AppSettingImpl obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.nickName)
      ..writeByte(1)
      ..write(obj.genba)
      ..writeByte(2)
      ..write(obj.oneDaySalary)
      ..writeByte(3)
      ..write(obj.meals)
      ..writeByte(4)
      ..write(obj.salaryDay)
      ..writeByte(5)
      ..write(obj.color00)
      ..writeByte(6)
      ..write(obj.color05)
      ..writeByte(7)
      ..write(obj.color10)
      ..writeByte(8)
      ..write(obj.color15)
      ..writeByte(9)
      ..write(obj.color20)
      ..writeByte(10)
      ..write(obj.seedColor)
      ..writeByte(11)
      ..write(obj.darkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSetting _$AppSettingFromJson(Map<String, dynamic> json) => AppSetting(
      nickName: json['nickName'] as String?,
      genba: json['genba'] as String?,
      oneDaySalary: json['oneDaySalary'] as int?,
      meals: json['meals'] as int?,
      salaryDay: json['salaryDay'] as int?,
      color00: json['color00'] as String?,
      color05: json['color05'] as String?,
      color10: json['color10'] as String?,
      color15: json['color15'] as String?,
      color20: json['color20'] as String?,
      seedColor: json['seedColor'] as String?,
      darkMode: json['darkMode'] as bool?,
    );

Map<String, dynamic> _$AppSettingToJson(AppSetting instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'genba': instance.genba,
      'oneDaySalary': instance.oneDaySalary,
      'meals': instance.meals,
      'salaryDay': instance.salaryDay,
      'color00': instance.color00,
      'color05': instance.color05,
      'color10': instance.color10,
      'color15': instance.color15,
      'color20': instance.color20,
      'seedColor': instance.seedColor,
      'darkMode': instance.darkMode,
    };
