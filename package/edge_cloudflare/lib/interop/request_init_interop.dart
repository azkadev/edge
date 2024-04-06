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
import 'dart:js_util' as js_util;
import 'package:js/js.dart';
import 'package:typings/core.dart' as interop;
import 'package:edge_dart_runtime/interop/utils_interop.dart';

extension CloudflareWorkersRequestInteropExtension on interop.RequestInit {
  set cf(CloudflareRequestInit properties) {
    js_util.setProperty(this, 'cf', properties);
  }
}

@anonymous
@JS()
@staticInterop
class CloudflareRequestInit {
  external factory CloudflareRequestInit();
}

extension PropsCloudflareRequestInit on CloudflareRequestInit {
  set cacheEverything(bool? value) {
    js_util.setProperty(this, 'cacheEverything', value ?? jsUndefined);
  }

  set cacheKey(bool? value) {
    js_util.setProperty(this, 'cacheKey', value ?? jsUndefined);
  }

  set cacheTags(Iterable<String>? value) {
    js_util.setProperty(this, 'cacheTags', value ?? jsUndefined);
  }

  set cacheTtl(int? value) {
    js_util.setProperty(this, 'cacheTtl', value ?? jsUndefined);
  }

  set cacheTtlByStatus(Map<String, int>? value) {
    js_util.setProperty(this, 'cacheTtlByStatus', value ?? jsUndefined);
  }

  set scrapeShield(bool? value) {
    js_util.setProperty(this, 'scrapeShield', value ?? jsUndefined);
  }

  set apps(bool? value) {
    js_util.setProperty(this, 'apps', value ?? jsUndefined);
  }

  set image(dynamic value) {
    js_util.setProperty(this, 'image', value ?? jsUndefined);
  }

  set minify(dynamic value) {
    js_util.setProperty(this, 'minify', value ?? jsUndefined);
  }

  set mirage(bool? value) {
    js_util.setProperty(this, 'mirage', value ?? jsUndefined);
  }

  set polish(String? value) {
    js_util.setProperty(this, 'polish', value ?? jsUndefined);
  }

  set resolveOverride(String? value) {
    js_util.setProperty(this, 'resolveOverride', value ?? jsUndefined);
  }
}

@anonymous
@JS()
@staticInterop
class RequestInitCfPropertiesImageMinify {
  external factory RequestInitCfPropertiesImageMinify();
}

extension PropsRequestInitCfPropertiesImageMinify
    on RequestInitCfPropertiesImageMinify {
  set javascript(bool? value) {
    js_util.setProperty(this, 'javascript', value ?? jsUndefined);
  }

  set css(bool? value) {
    js_util.setProperty(this, 'css', value ?? jsUndefined);
  }

  set html(bool? value) {
    js_util.setProperty(this, 'html', value ?? jsUndefined);
  }
}

@anonymous
@JS()
@staticInterop
class BasicImageTransformations {
  external factory BasicImageTransformations();
}

extension PropsBasicImageTransformations on BasicImageTransformations {
  set width(num? value) {
    js_util.setProperty(this, 'width', value ?? jsUndefined);
  }

  set height(num? value) {
    js_util.setProperty(this, 'height', value ?? jsUndefined);
  }

  set fit(String? value) {
    js_util.setProperty(this, 'fit', value ?? jsUndefined);
  }

  set gravity(dynamic value) {
    js_util.setProperty(this, 'gravity', value ?? jsUndefined);
  }

  set background(String? value) {
    js_util.setProperty(this, 'background', value ?? jsUndefined);
  }

  set rotate(int? value) {
    js_util.setProperty(this, 'rotate', value ?? jsUndefined);
  }
}

@anonymous
@JS()
@staticInterop
class RequestInitCfPropertiesImageDraw extends BasicImageTransformations {
  external factory RequestInitCfPropertiesImageDraw({
    required String url,
  });
}

extension PropsRequestInitCfPropertiesImageDraw
    on RequestInitCfPropertiesImageDraw {
  set opacity(num? value) {
    js_util.setProperty(this, 'opacity', value ?? jsUndefined);
  }

  set repeat(dynamic value) {
    js_util.setProperty(this, 'repeat', value ?? jsUndefined);
  }

  set top(num? value) {
    js_util.setProperty(this, 'top', value ?? jsUndefined);
  }

  set left(num? value) {
    js_util.setProperty(this, 'left', value ?? jsUndefined);
  }

  set bottom(num? value) {
    js_util.setProperty(this, 'bottom', value ?? jsUndefined);
  }

  set right(num? value) {
    js_util.setProperty(this, 'right', value ?? jsUndefined);
  }
}
