// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryData {

 String get flag; String get name;
/// Create a copy of CountryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryDataCopyWith<CountryData> get copyWith => _$CountryDataCopyWithImpl<CountryData>(this as CountryData, _$identity);

  /// Serializes this CountryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryData&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flag,name);

@override
String toString() {
  return 'CountryData(flag: $flag, name: $name)';
}


}

/// @nodoc
abstract mixin class $CountryDataCopyWith<$Res>  {
  factory $CountryDataCopyWith(CountryData value, $Res Function(CountryData) _then) = _$CountryDataCopyWithImpl;
@useResult
$Res call({
 String flag, String name
});




}
/// @nodoc
class _$CountryDataCopyWithImpl<$Res>
    implements $CountryDataCopyWith<$Res> {
  _$CountryDataCopyWithImpl(this._self, this._then);

  final CountryData _self;
  final $Res Function(CountryData) _then;

/// Create a copy of CountryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flag = null,Object? name = null,}) {
  return _then(_self.copyWith(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CountryData implements CountryData {
  const _CountryData({required this.flag, required this.name});
  factory _CountryData.fromJson(Map<String, dynamic> json) => _$CountryDataFromJson(json);

@override final  String flag;
@override final  String name;

/// Create a copy of CountryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryDataCopyWith<_CountryData> get copyWith => __$CountryDataCopyWithImpl<_CountryData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryData&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flag,name);

@override
String toString() {
  return 'CountryData(flag: $flag, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CountryDataCopyWith<$Res> implements $CountryDataCopyWith<$Res> {
  factory _$CountryDataCopyWith(_CountryData value, $Res Function(_CountryData) _then) = __$CountryDataCopyWithImpl;
@override @useResult
$Res call({
 String flag, String name
});




}
/// @nodoc
class __$CountryDataCopyWithImpl<$Res>
    implements _$CountryDataCopyWith<$Res> {
  __$CountryDataCopyWithImpl(this._self, this._then);

  final _CountryData _self;
  final $Res Function(_CountryData) _then;

/// Create a copy of CountryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flag = null,Object? name = null,}) {
  return _then(_CountryData(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
