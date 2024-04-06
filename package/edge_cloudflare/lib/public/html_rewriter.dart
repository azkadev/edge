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
import 'dart:async';
import 'dart:js';

import 'package:edge_dart_runtime/response.dart';
import 'package:edge_dart_runtime/interop/promise_interop.dart';
import '../interop/html_rewriter_interop.dart' as interop;

class HTMLRewriter {
  final interop.HTMLRewriter _delegate;

  HTMLRewriter._(this._delegate);

  HTMLRewriter() : _delegate = interop.HTMLRewriter();

  HTMLRewriter on(String selector, ElementHandler handler) {
    return HTMLRewriter._(_delegate.on(selector, handler._delegate));
  }

  HTMLRewriter onDocument(DocumentHandler handler) {
    return HTMLRewriter._(_delegate.onDocument(handler._delegate));
  }

  Response transform(Response response) =>
      responseFromJsObject(_delegate.transform(response.delegate));
}

extension HTMLRewriterExtension on HTMLRewriter {
  interop.HTMLRewriter get delegate => _delegate;
}

HTMLRewriter htmlRewriterFromJsObject(interop.HTMLRewriter jsObject) =>
    HTMLRewriter._(jsObject);

class ContentOptions {
  final interop.ContentOptions _delegate;
  ContentOptions({required bool html})
      : _delegate = interop.ContentOptions(html: html);
}

extension on ContentOptions {
  interop.ContentOptions get delegate => _delegate;
}

abstract class ElementHandler {
  FutureOr<void> element(Element element) {}
  FutureOr<void> comments(Comment comment) {}
  FutureOr<void> text(Text text) {}
}

extension on ElementHandler {
  interop.ElementHandler get _delegate {
    return interop.ElementHandler(
      element: allowInterop(
        (interop.Element obj) {
          return futureToPromise(Future(() => element(Element._(obj))));
        },
      ),
      comments: allowInterop(
        (interop.Comment obj) {
          return futureToPromise(Future(() => comments(Comment._(obj))));
        },
      ),
      text: allowInterop(
        (interop.Text obj) {
          return futureToPromise(Future(() => text(Text._(obj))));
        },
      ),
    );
  }
}

abstract class DocumentHandler {
  FutureOr<void> doctype(Doctype element) {}
  FutureOr<void> comments(Comment comment) {}
  FutureOr<void> text(Text text) {}
  FutureOr<void> end(DocumentEnd text) {}
}

extension on DocumentHandler {
  interop.DocumentHandler get _delegate {
    return interop.DocumentHandler(
      doctype: allowInterop(
        (interop.Doctype obj) {
          return futureToPromise(Future(() => doctype(Doctype._(obj))));
        },
      ),
      comments: allowInterop(
        (interop.Comment obj) {
          return futureToPromise(Future(() => comments(Comment._(obj))));
        },
      ),
      text: allowInterop(
        (interop.Text obj) {
          return futureToPromise(Future(() => text(Text._(obj))));
        },
      ),
      end: allowInterop(
        (interop.DocumentEnd obj) {
          return futureToPromise(Future(() => end(DocumentEnd._(obj))));
        },
      ),
    );
  }
}

class Doctype {
  final interop.Doctype _delegate;

  Doctype._(this._delegate);

  String? get name => _delegate.name;
  String? get publicId => _delegate.publicId;
  String? get systemId => _delegate.systemId;
}

class Comment {
  final interop.Comment _delegate;
  Comment._(this._delegate);

  String get text => _delegate.text;
  set text(String value) => _delegate.text = value;
  bool get removed => _delegate.removed;
  Comment before(String text, [ContentOptions? options]) =>
      Comment._(_delegate.before(text, options?.delegate));
  Comment after(String text, [ContentOptions? options]) =>
      Comment._(_delegate.after(text, options?.delegate));
  Comment replace(String text, [ContentOptions? options]) =>
      Comment._(_delegate.replace(text, options?.delegate));
  Comment remove() => Comment._(_delegate.remove());
}

class Text {
  final interop.Text _delegate;
  Text._(this._delegate);

  String get text => _delegate.text;
  bool get lastInTextNode => _delegate.lastInTextNode;
  bool get removed => _delegate.removed;
  Text before(String text, [ContentOptions? options]) =>
      Text._(_delegate.before(text, options?.delegate));
  Text after(String text, [ContentOptions? options]) =>
      Text._(_delegate.after(text, options?.delegate));
  Text replace(String text, [ContentOptions? options]) =>
      Text._(_delegate.replace(text, options?.delegate));
  Text remove() => Text._(_delegate.remove());
}

class DocumentEnd {
  final interop.DocumentEnd _delegate;
  DocumentEnd._(this._delegate);

  DocumentEnd append(String text, [ContentOptions? options]) =>
      DocumentEnd._(_delegate.append(text, options?.delegate));
}

class Element {
  final interop.Element _delegate;
  Element._(this._delegate);

  String get tagName => _delegate.tagName;
  set tagName(String value) => _delegate.tagName = value;
  Iterable<String> get attributes => _delegate.attributes;
  bool get removed => _delegate.removed;
  Uri get namespaceURI => Uri.parse(_delegate.namespaceURI);
  String? getAttribute(String name) => _delegate.getAttribute(name);
  bool hasAttribute(String name) => _delegate.hasAttribute(name);
  Element setAttribute(String name, String value) =>
      Element._(_delegate.setAttribute(name, value));
  Element removeAttribute(String name) =>
      Element._(_delegate.removeAttribute(name));
  Element before(String text, [ContentOptions? options]) =>
      Element._(_delegate.before(text, options?.delegate));
  Element after(String text, [ContentOptions? options]) =>
      Element._(_delegate.after(text, options?.delegate));
  Element prepend(String text, [ContentOptions? options]) =>
      Element._(_delegate.prepend(text, options?.delegate));
  Element append(String text, [ContentOptions? options]) =>
      Element._(_delegate.append(text, options?.delegate));
  Element replace(String text, [ContentOptions? options]) =>
      Element._(_delegate.replace(text, options?.delegate));
  Element remove() => Element._(_delegate.remove());
  Element removeAndKeepContent() => Element._(_delegate.removeAndKeepContent());
  void onEndTag(void Function(EndTag endTag) callback) {
    _delegate.onEndTag(allowInterop((interop.EndTag obj) {
      callback(EndTag._(obj));
    }));
  }
}

class EndTag {
  final interop.EndTag _delegate;
  EndTag._(this._delegate);

  String get name => _delegate.name;
  set name(String value) => _delegate.name = value;
  EndTag before(String text, [ContentOptions? options]) =>
      EndTag._(_delegate.before(text, options?.delegate));
  EndTag after(String text, [ContentOptions? options]) =>
      EndTag._(_delegate.after(text, options?.delegate));
  EndTag remove() => EndTag._(_delegate.remove());
}
