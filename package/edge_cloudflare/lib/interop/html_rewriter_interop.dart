import 'dart:js_util' as js_util;
import 'package:js/js.dart';
import 'package:typings/core.dart' as interop;
import 'package:edge_dart_runtime/interop/promise_interop.dart';

typedef HandlerMethod<T> = Promise<void> Function(T type);

@JS()
@staticInterop
class HTMLRewriter {
  external factory HTMLRewriter();
}

extension PropsHTMLRewriter on HTMLRewriter {
  HTMLRewriter on(String selector, ElementHandler handler) =>
      js_util.callMethod(this, 'on', [selector, handler]);

  HTMLRewriter onDocument(DocumentHandler handler) =>
      js_util.callMethod(this, 'onDocument', [handler]);

  interop.Response transform(interop.Response response) =>
      js_util.callMethod(this, 'transform', [response]);
}

@anonymous
@JS()
@staticInterop
class ElementHandler {
  external factory ElementHandler({
    HandlerMethod<Element>? element,
    HandlerMethod<Comment>? comments,
    HandlerMethod<Text>? text,
  });
}

@anonymous
@JS()
@staticInterop
class DocumentHandler {
  external factory DocumentHandler({
    HandlerMethod<Doctype>? doctype,
    HandlerMethod<Comment>? comments,
    HandlerMethod<Text>? text,
    HandlerMethod<DocumentEnd>? end,
  });
}

@anonymous
@JS()
@staticInterop
class ContentOptions {
  external factory ContentOptions({required bool html});
}

extension PropsContentOptions on ContentOptions {
  bool get html => js_util.getProperty(this, 'html');
  set html(bool newValue) {
    js_util.setProperty(this, 'html', newValue);
  }
}

@anonymous
@JS()
@staticInterop
class Doctype {
  external factory Doctype();
}

extension PropsDoctype on Doctype {
  String get name => js_util.getProperty(this, 'name');
  String get publicId => js_util.getProperty(this, 'publicId');
  String get systemId => js_util.getProperty(this, 'systemId');
}

@anonymous
@JS()
@staticInterop
class Comment {
  external factory Comment();
}

extension PropsComment on Comment {
  String get text => js_util.getProperty(this, 'text');
  set text(String newValue) {
    js_util.setProperty(this, 'text', newValue);
  }

  bool get removed => js_util.getProperty(this, 'removed');

  Comment before(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'before', [text, options]);

  Comment after(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'after', [text, options]);

  Comment replace(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'replace', [text, options]);

  Comment remove() => js_util.callMethod(this, 'remove', []);
}

@anonymous
@JS()
@staticInterop
class Text {
  external factory Text();
}

extension PropsText on Text {
  String get text => js_util.getProperty(this, 'text');
  bool get lastInTextNode => js_util.getProperty(this, 'lastInTextNode');
  bool get removed => js_util.getProperty(this, 'removed');

  Text before(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'before', [text, options]);

  Text after(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'after', [text, options]);

  Text replace(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'replace', [text, options]);

  Text remove() => js_util.callMethod(this, 'remove', []);
}

@anonymous
@JS()
@staticInterop
class DocumentEnd {
  external factory DocumentEnd();
}

extension PropsDocumentEnd on DocumentEnd {
  DocumentEnd append(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'append', [text, options]);
}

@anonymous
@JS()
@staticInterop
class Element {
  external factory Element();
}

extension PropsElement on Element {
  String get tagName => js_util.getProperty(this, 'tagName');
  set tagName(String newValue) {
    js_util.setProperty(this, 'tagName', newValue);
  }

  Iterable<String> get attributes => js_util.getProperty(this, 'attributes');
  bool get removed => js_util.getProperty(this, 'removed');
  String get namespaceURI => js_util.getProperty(this, 'namespaceURI');

  String? getAttribute(String name) =>
      js_util.callMethod(this, 'getAttribute', [name]);

  bool hasAttribute(String name) =>
      js_util.callMethod(this, 'hasAttribute', [name]);

  Element setAttribute(String name, String value) =>
      js_util.callMethod(this, 'setAttribute', [name, value]);

  Element removeAttribute(String name) =>
      js_util.callMethod(this, 'removeAttribute', [name]);

  Element before(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'before', [text, options]);

  Element after(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'after', [text, options]);

  Element prepend(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'prepend', [text, options]);

  Element append(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'append', [text, options]);

  Element replace(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'replace', [text, options]);

  Element remove() => js_util.callMethod(this, 'remove', []);

  Element removeAndKeepContent() =>
      js_util.callMethod(this, 'removeAndKeepContent', []);

  Element setInnerContent(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'setInnerContent', [text, options]);

  void onEndTag(dynamic handler) =>
      js_util.callMethod(this, 'onEndTag', [handler]);
}

@anonymous
@JS()
@staticInterop
class EndTag {
  external factory EndTag();
}

extension PropsEndTag on EndTag {
  String get name => js_util.getProperty(this, 'name');
  set name(String newValue) {
    js_util.setProperty(this, 'name', newValue);
  }

  EndTag before(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'before', [text, options]);
  EndTag after(String text, [ContentOptions? options]) =>
      js_util.callMethod(this, 'after', [text, options]);
  EndTag remove() => js_util.callMethod(this, 'remove', []);
}
