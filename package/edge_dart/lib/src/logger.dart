import 'package:mason_logger/mason_logger.dart';
import 'package:ansi_styles/ansi_styles.dart';

extension LoggerExtension on Logger {
  /// Writes an empty line to the console.
  void lineBreak() => write('\n');
}

extension StringExtension on String {
  /// Indents the string by [width] spaces.
  String indent(int width) {
    return (' ' * width) + this;
  }

  /// Prefixes the string with [char].
  String prefix(String char) {
    return AnsiStyles.gray(char) + ' ' + this;
  }
}
