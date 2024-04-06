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
// ignore_for_file: invalid_annotation_target

import 'package:edge_dart/src/compiler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

part 'config.freezed.dart';
part 'config.g.dart';

mixin BaseConfig {
  CompilerLevel? get devCompilerLevel;
  CompilerLevel? get prodCompilerLevel;
  bool? get exitWatchOnFailure;

  static T? evaluate<T extends Object>(
      List<BaseConfig> configs, T? Function(BaseConfig) evaluator) {
    // iterate in reverse order so that the last config in the list takes precedence
    for (var i = configs.length - 1; i >= 0; i--) {
      final result = evaluator(configs[i]);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

@freezed
class Config with _$Config {
  const factory Config({
    @Default(SupabaseConfig()) SupabaseConfig supabase,
    @Default(GlobalConfig()) GlobalConfig global,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  factory Config.loadFromYaml(String yaml) {
    return Config.fromJson(
      loadYamlNode(yaml).toProperJson() as Map<String, dynamic>,
    );
  }

  const Config._();

  T? get<T extends Object>(
    BaseConfig cfg,
    T? Function(BaseConfig cfg) getter,
  ) {
    return BaseConfig.evaluate([global, cfg], getter);
  }
}

@freezed
class SupabaseConfig with BaseConfig, _$SupabaseConfig {
  const factory SupabaseConfig({
    @Default('.') String projectPath,
    @Default(<String, String>{'dart_edge': 'lib/main.dart'})
    Map<String, String> functions,
    CompilerLevel? devCompilerLevel,
    CompilerLevel? prodCompilerLevel,
    bool? exitWatchOnFailure,
  }) = _SupabaseConfig;

  factory SupabaseConfig.fromJson(Map<String, dynamic> json) =>
      _$SupabaseConfigFromJson(json);
}

@freezed
class GlobalConfig with BaseConfig, _$GlobalConfig {
  const factory GlobalConfig({
    CompilerLevel? devCompilerLevel,
    CompilerLevel? prodCompilerLevel,
    bool? exitWatchOnFailure,
  }) = _GlobalConfig;

  factory GlobalConfig.fromJson(Map<String, dynamic> json) =>
      _$GlobalConfigFromJson(json);
}

extension on YamlNode {
  dynamic toProperJson() {
    if (this is YamlMap) {
      return <String, dynamic>{
        for (final node in (this as YamlMap).nodes.entries)
          (node.key as YamlNode).value as String: node.value.toProperJson(),
      };
    }
    if (this is YamlList) {
      return <dynamic>[
        for (final node in (this as YamlList).nodes) node.toProperJson(),
      ];
    }
    return value;
  }
}
