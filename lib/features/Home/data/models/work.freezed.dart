// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Work {
  @JsonKey(name: "genba")
  @HiveField(0)
  String get genba => throw _privateConstructorUsedError;
  @JsonKey(name: "manHour")
  @HiveField(1)
  double get manHour => throw _privateConstructorUsedError;
  @JsonKey(name: "totSalary")
  @HiveField(2)
  int get totSalary => throw _privateConstructorUsedError;
  @JsonKey(name: "meals")
  @HiveField(3)
  int get meals => throw _privateConstructorUsedError;
  @JsonKey(name: "memo")
  @HiveField(4)
  String get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkCopyWith<Work> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkCopyWith<$Res> {
  factory $WorkCopyWith(Work value, $Res Function(Work) then) =
      _$WorkCopyWithImpl<$Res, Work>;
  @useResult
  $Res call(
      {@JsonKey(name: "genba") @HiveField(0) String genba,
      @JsonKey(name: "manHour") @HiveField(1) double manHour,
      @JsonKey(name: "totSalary") @HiveField(2) int totSalary,
      @JsonKey(name: "meals") @HiveField(3) int meals,
      @JsonKey(name: "memo") @HiveField(4) String memo});
}

/// @nodoc
class _$WorkCopyWithImpl<$Res, $Val extends Work>
    implements $WorkCopyWith<$Res> {
  _$WorkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genba = null,
    Object? manHour = null,
    Object? totSalary = null,
    Object? meals = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      genba: null == genba
          ? _value.genba
          : genba // ignore: cast_nullable_to_non_nullable
              as String,
      manHour: null == manHour
          ? _value.manHour
          : manHour // ignore: cast_nullable_to_non_nullable
              as double,
      totSalary: null == totSalary
          ? _value.totSalary
          : totSalary // ignore: cast_nullable_to_non_nullable
              as int,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkImplCopyWith<$Res> implements $WorkCopyWith<$Res> {
  factory _$$WorkImplCopyWith(
          _$WorkImpl value, $Res Function(_$WorkImpl) then) =
      __$$WorkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "genba") @HiveField(0) String genba,
      @JsonKey(name: "manHour") @HiveField(1) double manHour,
      @JsonKey(name: "totSalary") @HiveField(2) int totSalary,
      @JsonKey(name: "meals") @HiveField(3) int meals,
      @JsonKey(name: "memo") @HiveField(4) String memo});
}

/// @nodoc
class __$$WorkImplCopyWithImpl<$Res>
    extends _$WorkCopyWithImpl<$Res, _$WorkImpl>
    implements _$$WorkImplCopyWith<$Res> {
  __$$WorkImplCopyWithImpl(_$WorkImpl _value, $Res Function(_$WorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genba = null,
    Object? manHour = null,
    Object? totSalary = null,
    Object? meals = null,
    Object? memo = null,
  }) {
    return _then(_$WorkImpl(
      genba: null == genba
          ? _value.genba
          : genba // ignore: cast_nullable_to_non_nullable
              as String,
      manHour: null == manHour
          ? _value.manHour
          : manHour // ignore: cast_nullable_to_non_nullable
              as double,
      totSalary: null == totSalary
          ? _value.totSalary
          : totSalary // ignore: cast_nullable_to_non_nullable
              as int,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1)
class _$WorkImpl implements _Work {
  const _$WorkImpl(
      {@JsonKey(name: "genba") @HiveField(0) required this.genba,
      @JsonKey(name: "manHour") @HiveField(1) required this.manHour,
      @JsonKey(name: "totSalary") @HiveField(2) required this.totSalary,
      @JsonKey(name: "meals") @HiveField(3) required this.meals,
      @JsonKey(name: "memo") @HiveField(4) required this.memo});

  @override
  @JsonKey(name: "genba")
  @HiveField(0)
  final String genba;
  @override
  @JsonKey(name: "manHour")
  @HiveField(1)
  final double manHour;
  @override
  @JsonKey(name: "totSalary")
  @HiveField(2)
  final int totSalary;
  @override
  @JsonKey(name: "meals")
  @HiveField(3)
  final int meals;
  @override
  @JsonKey(name: "memo")
  @HiveField(4)
  final String memo;

  @override
  String toString() {
    return 'Work(genba: $genba, manHour: $manHour, totSalary: $totSalary, meals: $meals, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkImpl &&
            (identical(other.genba, genba) || other.genba == genba) &&
            (identical(other.manHour, manHour) || other.manHour == manHour) &&
            (identical(other.totSalary, totSalary) ||
                other.totSalary == totSalary) &&
            (identical(other.meals, meals) || other.meals == meals) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, genba, manHour, totSalary, meals, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkImplCopyWith<_$WorkImpl> get copyWith =>
      __$$WorkImplCopyWithImpl<_$WorkImpl>(this, _$identity);
}

abstract class _Work implements Work {
  const factory _Work(
      {@JsonKey(name: "genba") @HiveField(0) required final String genba,
      @JsonKey(name: "manHour") @HiveField(1) required final double manHour,
      @JsonKey(name: "totSalary") @HiveField(2) required final int totSalary,
      @JsonKey(name: "meals") @HiveField(3) required final int meals,
      @JsonKey(name: "memo")
      @HiveField(4)
      required final String memo}) = _$WorkImpl;

  @override
  @JsonKey(name: "genba")
  @HiveField(0)
  String get genba;
  @override
  @JsonKey(name: "manHour")
  @HiveField(1)
  double get manHour;
  @override
  @JsonKey(name: "totSalary")
  @HiveField(2)
  int get totSalary;
  @override
  @JsonKey(name: "meals")
  @HiveField(3)
  int get meals;
  @override
  @JsonKey(name: "memo")
  @HiveField(4)
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$WorkImplCopyWith<_$WorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
