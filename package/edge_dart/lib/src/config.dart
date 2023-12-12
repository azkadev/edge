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
