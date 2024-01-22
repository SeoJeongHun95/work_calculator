// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkImplAdapter extends TypeAdapter<_$WorkImpl> {
  @override
  final int typeId = 1;

  @override
  _$WorkImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WorkImpl(
      genba: fields[0] as String,
      manHour: fields[1] as double,
      totSalary: fields[2] as int,
      meals: fields[3] as int,
      memo: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$WorkImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.genba)
      ..writeByte(1)
      ..write(obj.manHour)
      ..writeByte(2)
      ..write(obj.totSalary)
      ..writeByte(3)
      ..write(obj.meals)
      ..writeByte(4)
      ..write(obj.memo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) => Work(
      genba: json['genba'] as String,
      manHour: (json['manHour'] as num).toDouble(),
      totSalary: json['totSalary'] as int,
      meals: json['meals'] as int,
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      'genba': instance.genba,
      'manHour': instance.manHour,
      'totSalary': instance.totSalary,
      'meals': instance.meals,
      'memo': instance.memo,
    };
