import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:edge_dart_runtime/edge_dart_runtime.dart';

const kUnsupportedEnv = 'Unsupported environment';

class ClientClosedException implements Exception {}

class AbortedByClientException implements Exception {}

class HttpClient implements io.HttpClient {
  @override
  bool autoUncompress = false;
  @override
  Duration? connectionTimeout;

  @override
  Duration idleTimeout = const Duration(seconds: 120);

  @override
  int? maxConnectionsPerHost;

  @override
  String? userAgent;

  Set<HttpClientRequest> _pendingRequests = {};

  @override
  void addCredentials(
    Uri url,
    String realm,
    io.HttpClientCredentials credentials,
  ) {
    // TODO: implement addCredentials
  }

  @override
  void addProxyCredentials(
    String host,
    int port,
    String realm,
    io.HttpClientCredentials credentials,
  ) {
    // TODO: implement addProxyCredentials
  }

  @override
  set authenticate(
    Future<bool> Function(Uri url, String scheme, String? realm)? f,
  ) {
    // TODO: implement authenticate
  }

  @override
  set authenticateProxy(
    Future<bool> Function(
      String host,
      int port,
      String scheme,
      String? realm,
    )? f,
  ) {
    // TODO: implement authenticateProxy
  }

  @override
  set badCertificateCallback(
    bool Function(io.X509Certificate cert, String host, int port)? callback,
  ) {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  void close({bool force = false}) {
    _pendingRequests.forEach((request) {
      request.abort(new ClientClosedException());
    });
  }

  @override
  set connectionFactory(
    Future<io.ConnectionTask<io.Socket>> Function(
      Uri url,
      String? proxyHost,
      int? proxyPort,
    )? f,
  ) {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  Future<io.HttpClientRequest> delete(String host, int port, String path) {
    return open('DELETE', host, port, path);
  }

  @override
  Future<io.HttpClientRequest> deleteUrl(Uri url) {
    return openUrl('DELETE', url);
  }

  @override
  set findProxy(String Function(Uri url)? f) {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  Future<io.HttpClientRequest> get(String host, int port, String path) {
    return open('GET', host, port, path);
  }

  @override
  Future<io.HttpClientRequest> getUrl(Uri url) {
    return openUrl('GET', url);
  }

  @override
  Future<io.HttpClientRequest> head(String host, int port, String path) {
    return open('HEAD', host, port, path);
  }

  @override
  Future<io.HttpClientRequest> headUrl(Uri url) {
    return openUrl('HEAD', url);
  }

  @override
  set keyLog(Function(String line)? callback) {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  Future<io.HttpClientRequest> open(
    String method,
    String host,
    int port,
    String path,
  ) async {
    final ctrl = AbortController();

    return HttpClientRequest._(
      method,
      Resource.uri(
        Uri(
          scheme: 'http',
          host: host,
          port: port,
          path: path,
        ),
      ),
      ctrl,
      _pendingRequests,
    );
  }

  @override
  Future<io.HttpClientRequest> openUrl(String method, Uri url) {
    final ctrl = AbortController();
    return Future.value(
      HttpClientRequest._(method, Resource.uri(url), ctrl, _pendingRequests),
    );
  }

  @override
  Future<io.HttpClientRequest> patch(String host, int port, String path) {
    return open('PATCH', host, port, path);
  }

  @override
  Future<io.HttpClientRequest> patchUrl(Uri url) {
    return openUrl('PATCH', url);
  }

  @override
  Future<io.HttpClientRequest> post(String host, int port, String path) {
    return open('POST', host, port, path);
  }

  @override
  Future<io.HttpClientRequest> postUrl(Uri url) {
    return openUrl('POST', url);
  }

  @override
  Future<io.HttpClientRequest> put(String host, int port, String path) {
    return open('PUT', host, port, path);
  }

  @override
  Future<io.HttpClientRequest> putUrl(Uri url) {
    return openUrl('PUT', url);
  }
}

class HttpClientRequest implements io.HttpClientRequest {
  @override
  bool bufferOutput = true;

  get contentLength => headers.contentLength;
  set contentLength(int value) {
    headers.contentLength = value;
  }

  @override
  late Encoding encoding;

  @override
  bool followRedirects = true;

  @override
  int maxRedirects = 5;

  get persistentConnection => headers.persistentConnection;
  set persistentConnection(bool value) {
    headers.persistentConnection = value;
  }

  final io.HttpHeaders headers;

  final String method;
  late final Uri uri;

  final Resource _resource;
  List<int>? _body;
  final Completer<io.HttpClientResponse> _doneCompleter = Completer();

  AbortController _abortController;

  HttpClientRequest._(
    this.method,
    this._resource,
    this._abortController,
    Set<HttpClientRequest> pendingRequests,
  ) : headers = HttpHeaders._() {
    uri = Resource.getUri(_resource);
    pendingRequests.add(this);
    done.whenComplete(() => pendingRequests.remove(this));

    headers.host = uri.host;
    headers.port = uri.port;
  }

  @override
  void abort([Object? exception, StackTrace? stackTrace]) {
    _abortController.abort(exception);
    _doneCompleter.completeError(
      exception ?? AbortedByClientException(),
      stackTrace,
    );
  }

  @override
  void add(List<int> data) {
    _body ??= [];
    _body!.addAll(data);

    contentLength = _body!.length;
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    abort(error, stackTrace);
    _doneCompleter.completeError(error, stackTrace);
  }

  @override
  Future addStream(Stream<List<int>> stream) {
    final completer = Completer();

    stream.listen(
      add,
      onDone: () => completer.complete(),
      onError: (e, s) => completer.completeError(e, s),
    );

    completer.future.catchError((e, s) {
      _doneCompleter.completeError(e, s);
      throw e;
    });

    return completer.future;
  }

  @override
  Future<HttpClientResponse> close() async {
    final fetchResponse = await fetch(
      _resource,
      body: _body != null ? Uint8List.fromList(_body!) : null,
      headers: Headers((headers as HttpHeaders).toMap()),
      method: method,
      signal: _abortController.signal,
    );

    final response = HttpClientResponse(fetchResponse);
    _doneCompleter.complete(response);
    return response;
  }

  @override
  io.HttpConnectionInfo? get connectionInfo {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  // TODO: implement cookies
  List<io.Cookie> get cookies => throw UnimplementedError();

  @override
  Future<io.HttpClientResponse> get done => _doneCompleter.future;

  @override
  Future flush() async {
    return Future.value();
  }

  @override
  void write(Object? object) {
    add(utf8.encode(object.toString()));
  }

  @override
  void writeAll(Iterable objects, [String separator = ""]) {
    write(objects.join(separator));
  }

  @override
  void writeCharCode(int charCode) {
    add([charCode]);
  }

  @override
  void writeln([Object? object = ""]) {
    write(object);
    writeCharCode('\n'.codeUnitAt(0));
  }
}

class HttpHeaders implements io.HttpHeaders {
  HttpHeaders._();

  factory HttpHeaders.fromFetchResponseHeaders(Headers headers) {
    final ioHeaders = HttpHeaders._();

    headers.toMap().forEach((key, value) {
      ioHeaders.set(key, value);
    });

    return ioHeaders;
  }

  @override
  bool get chunkedTransferEncoding {
    return value(io.HttpHeaders.transferEncodingHeader) == 'chunked';
  }

  set chunkedTransferEncoding(bool value) {
    if (value) {
      set(io.HttpHeaders.transferEncodingHeader, 'chunked');
    } else {
      _headers.remove(io.HttpHeaders.transferEncodingHeader);
    }
  }

  @override
  int get contentLength {
    return int.parse(value(io.HttpHeaders.contentLengthHeader)!);
  }

  set contentLength(int value) {
    set(io.HttpHeaders.contentLengthHeader, value);
  }

  @override
  io.ContentType? get contentType {
    final contentType = value(io.HttpHeaders.contentTypeHeader);
    return contentType != null ? io.ContentType.parse(contentType) : null;
  }

  set contentType(io.ContentType? value) {
    if (value != null) {
      set(io.HttpHeaders.contentTypeHeader, value);
    } else {
      _headers.remove(io.HttpHeaders.contentTypeHeader);
    }
  }

  @override
  bool get persistentConnection {
    return value(io.HttpHeaders.connectionHeader) == 'keep-alive';
  }

  set persistentConnection(bool value) {
    set(io.HttpHeaders.connectionHeader, value ? 'keep-alive' : 'close');
  }

  DateTime? get date {
    final string = value('date');
    if (string == null) return null;

    try {
      return DateTime.parse(string);
    } on FormatException {
      return null;
    }
  }

  set date(DateTime? value) {
    if (value != null) {
      set('date', value.toUtc().toIso8601String());
    } else {
      _headers.remove('date');
    }
  }

  DateTime? get expires {
    final string = value('expires');
    if (string == null) return null;

    try {
      return DateTime.parse(string);
    } on FormatException {
      return null;
    }
  }

  set expires(DateTime? value) {
    if (value != null) {
      set('expires', value.toUtc().toIso8601String());
    } else {
      _headers.remove('expires');
    }
  }

  get host => value('host');
  set host(String? value) {
    if (value != null) {
      set('host', value);
    } else {
      _headers.remove('host');
    }
  }

  get ifModifiedSince {
    final string = value('if-modified-since');
    if (string == null) return null;

    try {
      return DateTime.parse(string);
    } on FormatException {
      return null;
    }
  }

  set ifModifiedSince(DateTime? value) {
    if (value != null) {
      set('if-modified-since', value.toUtc().toIso8601String());
    } else {
      _headers.remove('if-modified-since');
    }
  }

  int? get port {
    final host = value('host');
    if (host == null) return null;

    final uri = Uri.tryParse('http://$host');
    if (uri == null) return null;

    return uri.port;
  }

  set port(int? v) {
    if (v != null) {
      set('host', '$host:$v');
    } else {
      final host = value('host');
      if (host != null) {
        final uri = Uri.tryParse('http://$host');
        if (uri != null) {
          set('host', uri.host);
        }
      }
    }
  }

  Map<String, Set<String>> _headers = {};

  @override
  List<String>? operator [](String name) {
    return _headers[name]?.toList();
  }

  @override
  void add(String name, Object value, {bool preserveHeaderCase = false}) {
    final _name = preserveHeaderCase ? name : name.toLowerCase();
    _headers[_name] ??= {};
    _headers[_name]!.add(value.toString());
  }

  @override
  void clear() {
    _headers.clear();
  }

  @override
  void forEach(void Function(String name, List<String> values) action) {
    _headers.forEach((key, value) {
      action(key, value.toList());
    });
  }

  @override
  void noFolding(String name) {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  void remove(String name, Object value) {
    _headers[name]?.remove(value.toString());
  }

  @override
  void removeAll(String name) {
    _headers.remove(name);
  }

  @override
  void set(String name, Object value, {bool preserveHeaderCase = false}) {
    final _name = preserveHeaderCase ? name : name.toLowerCase();
    _headers[_name] = {value.toString()};
  }

  @override
  String? value(String name) {
    if (_headers[name] == null) {
      return null;
    }

    if (_headers[name]!.length > 1) {
      throw StateError('More than one value for header $name');
    }

    return _headers[name]?.first;
  }

  Map<String, String> toMap() {
    final map = <String, String>{};

    _headers.forEach((key, value) {
      map[key] = value.join(',');
    });

    return map;
  }
}

class HttpClientResponse implements io.HttpClientResponse {
  final Response _response;
  late final int contentLength;
  late final io.HttpHeaders headers;
  late final Stream<List<int>> _body;

  HttpClientResponse(this._response) {
    headers = HttpHeaders.fromFetchResponseHeaders(_response.headers);
    _body = _response.body ?? Stream.empty();

    final contentLengthHeader =
        headers.value(io.HttpHeaders.contentLengthHeader);
    contentLength = int.parse(contentLengthHeader ?? '-1');
  }

  @override
  io.X509Certificate? get certificate =>
      throw UnsupportedError(kUnsupportedEnv);

  @override
  io.HttpClientResponseCompressionState get compressionState {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  io.HttpConnectionInfo? get connectionInfo {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  // TODO: implement cookies
  List<io.Cookie> get cookies => throw UnimplementedError();

  @override
  Future<io.Socket> detachSocket() {
    throw UnsupportedError(kUnsupportedEnv);
  }

  @override
  bool get isRedirect => _response.redirected;

  @override
  bool get persistentConnection {
    return _response.headers.get('connection') == 'keep-alive';
  }

  @override
  String get reasonPhrase => _response.statusText;

  @override
  Future<io.HttpClientResponse> redirect([
    String? method,
    Uri? url,
    bool? followLoops,
  ]) {
    // TODO: implement redirect
    throw UnimplementedError();
  }

  @override
  // TODO: implement redirects
  List<io.RedirectInfo> get redirects => throw UnimplementedError();

  @override
  int get statusCode => _response.status;

  @override
  Future<bool> any(bool Function(List<int> element) test) {
    return _body.any(test);
  }

  @override
  Stream<List<int>> asBroadcastStream({
    void Function(StreamSubscription<List<int>> subscription)? onListen,
    void Function(StreamSubscription<List<int>> subscription)? onCancel,
  }) {
    return _body.asBroadcastStream(onListen: onListen, onCancel: onCancel);
  }

  @override
  Stream<E> asyncExpand<E>(Stream<E>? Function(List<int> event) convert) {
    return _body.asyncExpand(convert);
  }

  @override
  Stream<E> asyncMap<E>(FutureOr<E> Function(List<int> event) convert) {
    return _body.asyncMap(convert);
  }

  @override
  Stream<R> cast<R>() {
    return _body.cast<R>();
  }

  @override
  Future<bool> contains(Object? needle) {
    return _body.contains(needle);
  }

  @override
  Stream<List<int>> distinct([
    bool Function(List<int> previous, List<int> next)? equals,
  ]) {
    return _body.distinct(equals);
  }

  @override
  Future<E> drain<E>([E? futureValue]) {
    return _body.drain(futureValue);
  }

  @override
  Future<List<int>> elementAt(int index) {
    return _body.elementAt(index);
  }

  @override
  Future<bool> every(bool Function(List<int> element) test) {
    return _body.every(test);
  }

  @override
  Stream<S> expand<S>(Iterable<S> Function(List<int> element) convert) {
    return _body.expand(convert);
  }

  @override
  Future<List<int>> get first => _body.first;

  @override
  Future<List<int>> firstWhere(
    bool Function(List<int> element) test, {
    List<int> Function()? orElse,
  }) {
    return _body.firstWhere(test, orElse: orElse);
  }

  @override
  Future<S> fold<S>(
    S initialValue,
    S Function(S previous, List<int> element) combine,
  ) {
    return _body.fold(initialValue, combine);
  }

  @override
  Future forEach(void Function(List<int> element) action) {
    return _body.forEach(action);
  }

  @override
  Stream<List<int>> handleError(
    Function onError, {
    bool Function(dynamic error)? test,
  }) {
    return _body.handleError(onError, test: test);
  }

  @override
  bool get isBroadcast => _body.isBroadcast;

  @override
  Future<bool> get isEmpty => _body.isEmpty;

  @override
  Future<String> join([String separator = ""]) {
    return _body.join(separator);
  }

  @override
  Future<List<int>> get last => _body.last;

  @override
  Future<List<int>> lastWhere(
    bool Function(List<int> element) test, {
    List<int> Function()? orElse,
  }) {
    return _body.lastWhere(test, orElse: orElse);
  }

  @override
  Future<int> get length => _body.length;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _body.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  Stream<S> map<S>(S Function(List<int> event) convert) {
    return _body.map(convert);
  }

  @override
  Future pipe(StreamConsumer<List<int>> streamConsumer) {
    return _body.pipe(streamConsumer);
  }

  @override
  Future<List<int>> reduce(
    List<int> Function(List<int> previous, List<int> element) combine,
  ) {
    return _body.reduce(combine);
  }

  @override
  Future<List<int>> get single => _body.single;

  @override
  Future<List<int>> singleWhere(
    bool Function(List<int> element) test, {
    List<int> Function()? orElse,
  }) {
    return _body.singleWhere(test, orElse: orElse);
  }

  @override
  Stream<List<int>> skip(int count) {
    return _body.skip(count);
  }

  @override
  Stream<List<int>> skipWhile(bool Function(List<int> element) test) {
    return _body.skipWhile(test);
  }

  @override
  Stream<List<int>> take(int count) {
    return _body.take(count);
  }

  @override
  Stream<List<int>> takeWhile(bool Function(List<int> element) test) {
    return _body.takeWhile(test);
  }

  @override
  Stream<List<int>> timeout(
    Duration timeLimit, {
    void Function(EventSink<List<int>> sink)? onTimeout,
  }) {
    return _body.timeout(timeLimit, onTimeout: onTimeout);
  }

  @override
  Future<List<List<int>>> toList() {
    return _body.toList();
  }

  @override
  Future<Set<List<int>>> toSet() {
    return _body.toSet();
  }

  @override
  Stream<S> transform<S>(StreamTransformer<List<int>, S> streamTransformer) {
    return _body.transform(streamTransformer);
  }

  @override
  Stream<List<int>> where(bool Function(List<int> event) test) {
    return _body.where(test);
  }
}
