/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  SupabaseConfig get supabase => throw _privateConstructorUsedError;
  GlobalConfig get global => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call({SupabaseConfig supabase, GlobalConfig global});

  $SupabaseConfigCopyWith<$Res> get supabase;
  $GlobalConfigCopyWith<$Res> get global;
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supabase = null,
    Object? global = null,
  }) {
    return _then(_value.copyWith(
      supabase: null == supabase
          ? _value.supabase
          : supabase // ignore: cast_nullable_to_non_nullable
              as SupabaseConfig,
      global: null == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as GlobalConfig,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupabaseConfigCopyWith<$Res> get supabase {
    return $SupabaseConfigCopyWith<$Res>(_value.supabase, (value) {
      return _then(_value.copyWith(supabase: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GlobalConfigCopyWith<$Res> get global {
    return $GlobalConfigCopyWith<$Res>(_value.global, (value) {
      return _then(_value.copyWith(global: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SupabaseConfig supabase, GlobalConfig global});

  @override
  $SupabaseConfigCopyWith<$Res> get supabase;
  @override
  $GlobalConfigCopyWith<$Res> get global;
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$_Config>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supabase = null,
    Object? global = null,
  }) {
    return _then(_$_Config(
      supabase: null == supabase
          ? _value.supabase
          : supabase // ignore: cast_nullable_to_non_nullable
              as SupabaseConfig,
      global: null == global
          ? _value.global
          : global // ignore: cast_nullable_to_non_nullable
              as GlobalConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Config extends _Config {
  const _$_Config(
      {this.supabase = const SupabaseConfig(),
      this.global = const GlobalConfig()})
      : super._();

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  @override
  @JsonKey()
  final SupabaseConfig supabase;
  @override
  @JsonKey()
  final GlobalConfig global;

  @override
  String toString() {
    return 'Config(supabase: $supabase, global: $global)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            (identical(other.supabase, supabase) ||
                other.supabase == supabase) &&
            (identical(other.global, global) || other.global == global));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, supabase, global);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(
      this,
    );
  }
}

abstract class _Config extends Config {
  const factory _Config(
      {final SupabaseConfig supabase, final GlobalConfig global}) = _$_Config;
  const _Config._() : super._();

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  SupabaseConfig get supabase;
  @override
  GlobalConfig get global;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}

SupabaseConfig _$SupabaseConfigFromJson(Map<String, dynamic> json) {
  return _SupabaseConfig.fromJson(json);
}

/// @nodoc
mixin _$SupabaseConfig {
  String get projectPath => throw _privateConstructorUsedError;
  Map<String, String> get functions => throw _privateConstructorUsedError;
  CompilerLevel? get devCompilerLevel => throw _privateConstructorUsedError;
  CompilerLevel? get prodCompilerLevel => throw _privateConstructorUsedError;
  bool? get exitWatchOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupabaseConfigCopyWith<SupabaseConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupabaseConfigCopyWith<$Res> {
  factory $SupabaseConfigCopyWith(
          SupabaseConfig value, $Res Function(SupabaseConfig) then) =
      _$SupabaseConfigCopyWithImpl<$Res, SupabaseConfig>;
  @useResult
  $Res call(
      {String projectPath,
      Map<String, String> functions,
      CompilerLevel? devCompilerLevel,
      CompilerLevel? prodCompilerLevel,
      bool? exitWatchOnFailure});
}

/// @nodoc
class _$SupabaseConfigCopyWithImpl<$Res, $Val extends SupabaseConfig>
    implements $SupabaseConfigCopyWith<$Res> {
  _$SupabaseConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
    Object? functions = null,
    Object? devCompilerLevel = freezed,
    Object? prodCompilerLevel = freezed,
    Object? exitWatchOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      functions: null == functions
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      devCompilerLevel: freezed == devCompilerLevel
          ? _value.devCompilerLevel
          : devCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      prodCompilerLevel: freezed == prodCompilerLevel
          ? _value.prodCompilerLevel
          : prodCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      exitWatchOnFailure: freezed == exitWatchOnFailure
          ? _value.exitWatchOnFailure
          : exitWatchOnFailure // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupabaseConfigCopyWith<$Res>
    implements $SupabaseConfigCopyWith<$Res> {
  factory _$$_SupabaseConfigCopyWith(
          _$_SupabaseConfig value, $Res Function(_$_SupabaseConfig) then) =
      __$$_SupabaseConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectPath,
      Map<String, String> functions,
      CompilerLevel? devCompilerLevel,
      CompilerLevel? prodCompilerLevel,
      bool? exitWatchOnFailure});
}

/// @nodoc
class __$$_SupabaseConfigCopyWithImpl<$Res>
    extends _$SupabaseConfigCopyWithImpl<$Res, _$_SupabaseConfig>
    implements _$$_SupabaseConfigCopyWith<$Res> {
  __$$_SupabaseConfigCopyWithImpl(
      _$_SupabaseConfig _value, $Res Function(_$_SupabaseConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectPath = null,
    Object? functions = null,
    Object? devCompilerLevel = freezed,
    Object? prodCompilerLevel = freezed,
    Object? exitWatchOnFailure = freezed,
  }) {
    return _then(_$_SupabaseConfig(
      projectPath: null == projectPath
          ? _value.projectPath
          : projectPath // ignore: cast_nullable_to_non_nullable
              as String,
      functions: null == functions
          ? _value._functions
          : functions // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      devCompilerLevel: freezed == devCompilerLevel
          ? _value.devCompilerLevel
          : devCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      prodCompilerLevel: freezed == prodCompilerLevel
          ? _value.prodCompilerLevel
          : prodCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      exitWatchOnFailure: freezed == exitWatchOnFailure
          ? _value.exitWatchOnFailure
          : exitWatchOnFailure // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupabaseConfig implements _SupabaseConfig {
  const _$_SupabaseConfig(
      {this.projectPath = '.',
      final Map<String, String> functions = const <String, String>{
        'dart_edge': 'lib/main.dart'
      },
      this.devCompilerLevel,
      this.prodCompilerLevel,
      this.exitWatchOnFailure})
      : _functions = functions;

  factory _$_SupabaseConfig.fromJson(Map<String, dynamic> json) =>
      _$$_SupabaseConfigFromJson(json);

  @override
  @JsonKey()
  final String projectPath;
  final Map<String, String> _functions;
  @override
  @JsonKey()
  Map<String, String> get functions {
    if (_functions is EqualUnmodifiableMapView) return _functions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_functions);
  }

  @override
  final CompilerLevel? devCompilerLevel;
  @override
  final CompilerLevel? prodCompilerLevel;
  @override
  final bool? exitWatchOnFailure;

  @override
  String toString() {
    return 'SupabaseConfig(projectPath: $projectPath, functions: $functions, devCompilerLevel: $devCompilerLevel, prodCompilerLevel: $prodCompilerLevel, exitWatchOnFailure: $exitWatchOnFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupabaseConfig &&
            (identical(other.projectPath, projectPath) ||
                other.projectPath == projectPath) &&
            const DeepCollectionEquality()
                .equals(other._functions, _functions) &&
            (identical(other.devCompilerLevel, devCompilerLevel) ||
                other.devCompilerLevel == devCompilerLevel) &&
            (identical(other.prodCompilerLevel, prodCompilerLevel) ||
                other.prodCompilerLevel == prodCompilerLevel) &&
            (identical(other.exitWatchOnFailure, exitWatchOnFailure) ||
                other.exitWatchOnFailure == exitWatchOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectPath,
      const DeepCollectionEquality().hash(_functions),
      devCompilerLevel,
      prodCompilerLevel,
      exitWatchOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupabaseConfigCopyWith<_$_SupabaseConfig> get copyWith =>
      __$$_SupabaseConfigCopyWithImpl<_$_SupabaseConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupabaseConfigToJson(
      this,
    );
  }
}

abstract class _SupabaseConfig implements SupabaseConfig {
  const factory _SupabaseConfig(
      {final String projectPath,
      final Map<String, String> functions,
      final CompilerLevel? devCompilerLevel,
      final CompilerLevel? prodCompilerLevel,
      final bool? exitWatchOnFailure}) = _$_SupabaseConfig;

  factory _SupabaseConfig.fromJson(Map<String, dynamic> json) =
      _$_SupabaseConfig.fromJson;

  @override
  String get projectPath;
  @override
  Map<String, String> get functions;
  @override
  CompilerLevel? get devCompilerLevel;
  @override
  CompilerLevel? get prodCompilerLevel;
  @override
  bool? get exitWatchOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$_SupabaseConfigCopyWith<_$_SupabaseConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalConfig _$GlobalConfigFromJson(Map<String, dynamic> json) {
  return _GlobalConfig.fromJson(json);
}

/// @nodoc
mixin _$GlobalConfig {
  CompilerLevel? get devCompilerLevel => throw _privateConstructorUsedError;
  CompilerLevel? get prodCompilerLevel => throw _privateConstructorUsedError;
  bool? get exitWatchOnFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalConfigCopyWith<GlobalConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalConfigCopyWith<$Res> {
  factory $GlobalConfigCopyWith(
          GlobalConfig value, $Res Function(GlobalConfig) then) =
      _$GlobalConfigCopyWithImpl<$Res, GlobalConfig>;
  @useResult
  $Res call(
      {CompilerLevel? devCompilerLevel,
      CompilerLevel? prodCompilerLevel,
      bool? exitWatchOnFailure});
}

/// @nodoc
class _$GlobalConfigCopyWithImpl<$Res, $Val extends GlobalConfig>
    implements $GlobalConfigCopyWith<$Res> {
  _$GlobalConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devCompilerLevel = freezed,
    Object? prodCompilerLevel = freezed,
    Object? exitWatchOnFailure = freezed,
  }) {
    return _then(_value.copyWith(
      devCompilerLevel: freezed == devCompilerLevel
          ? _value.devCompilerLevel
          : devCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      prodCompilerLevel: freezed == prodCompilerLevel
          ? _value.prodCompilerLevel
          : prodCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      exitWatchOnFailure: freezed == exitWatchOnFailure
          ? _value.exitWatchOnFailure
          : exitWatchOnFailure // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GlobalConfigCopyWith<$Res>
    implements $GlobalConfigCopyWith<$Res> {
  factory _$$_GlobalConfigCopyWith(
          _$_GlobalConfig value, $Res Function(_$_GlobalConfig) then) =
      __$$_GlobalConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CompilerLevel? devCompilerLevel,
      CompilerLevel? prodCompilerLevel,
      bool? exitWatchOnFailure});
}

/// @nodoc
class __$$_GlobalConfigCopyWithImpl<$Res>
    extends _$GlobalConfigCopyWithImpl<$Res, _$_GlobalConfig>
    implements _$$_GlobalConfigCopyWith<$Res> {
  __$$_GlobalConfigCopyWithImpl(
      _$_GlobalConfig _value, $Res Function(_$_GlobalConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devCompilerLevel = freezed,
    Object? prodCompilerLevel = freezed,
    Object? exitWatchOnFailure = freezed,
  }) {
    return _then(_$_GlobalConfig(
      devCompilerLevel: freezed == devCompilerLevel
          ? _value.devCompilerLevel
          : devCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      prodCompilerLevel: freezed == prodCompilerLevel
          ? _value.prodCompilerLevel
          : prodCompilerLevel // ignore: cast_nullable_to_non_nullable
              as CompilerLevel?,
      exitWatchOnFailure: freezed == exitWatchOnFailure
          ? _value.exitWatchOnFailure
          : exitWatchOnFailure // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GlobalConfig implements _GlobalConfig {
  const _$_GlobalConfig(
      {this.devCompilerLevel, this.prodCompilerLevel, this.exitWatchOnFailure});

  factory _$_GlobalConfig.fromJson(Map<String, dynamic> json) =>
      _$$_GlobalConfigFromJson(json);

  @override
  final CompilerLevel? devCompilerLevel;
  @override
  final CompilerLevel? prodCompilerLevel;
  @override
  final bool? exitWatchOnFailure;

  @override
  String toString() {
    return 'GlobalConfig(devCompilerLevel: $devCompilerLevel, prodCompilerLevel: $prodCompilerLevel, exitWatchOnFailure: $exitWatchOnFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalConfig &&
            (identical(other.devCompilerLevel, devCompilerLevel) ||
                other.devCompilerLevel == devCompilerLevel) &&
            (identical(other.prodCompilerLevel, prodCompilerLevel) ||
                other.prodCompilerLevel == prodCompilerLevel) &&
            (identical(other.exitWatchOnFailure, exitWatchOnFailure) ||
                other.exitWatchOnFailure == exitWatchOnFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, devCompilerLevel, prodCompilerLevel, exitWatchOnFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalConfigCopyWith<_$_GlobalConfig> get copyWith =>
      __$$_GlobalConfigCopyWithImpl<_$_GlobalConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GlobalConfigToJson(
      this,
    );
  }
}

abstract class _GlobalConfig implements GlobalConfig {
  const factory _GlobalConfig(
      {final CompilerLevel? devCompilerLevel,
      final CompilerLevel? prodCompilerLevel,
      final bool? exitWatchOnFailure}) = _$_GlobalConfig;

  factory _GlobalConfig.fromJson(Map<String, dynamic> json) =
      _$_GlobalConfig.fromJson;

  @override
  CompilerLevel? get devCompilerLevel;
  @override
  CompilerLevel? get prodCompilerLevel;
  @override
  bool? get exitWatchOnFailure;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalConfigCopyWith<_$_GlobalConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
