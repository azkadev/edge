import 'interop/deno_interop.dart' as interop;

class Env {
  final interop.Env _delegate;

  Env._(this._delegate);

  /// Retrieve the value of an environment variable.
  ///
  /// Returns `null` if the supplied environment variable is not defined.
  String? get(String key) => _delegate.get(key);

  /// Set the value of an environment variable.
  void set(String key, String value) => _delegate.set(key, value);

  /// Delete the value of an environment variable.
  void delete(String key) => _delegate.delete(key);

  /// Check whether an environment variable is present or not.
  bool has(String key) => _delegate.has(key);

  /// Returns a snapshot of the environment variables at invocation as a simple Map of keys and values.
  Map<String, String> toJson() => _delegate.toObject();
}

Env envFromJsObject(interop.Env env) {
  return Env._(env);
}
