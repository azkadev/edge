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
import '../interop/request_init_interop.dart' as interop;

class CloudflareRequestInit {
  bool? cacheEverything;
  bool? cacheKey;
  Iterable<String>? cacheTags;
  int? cacheTtl;
  Map<String, int>? cacheTtlByStatus;
  bool? scrapeShield;
  bool? apps;
  CloudflareRequestInitImageDraw? image;
  CloudflareRequestInitImageMinify? minify;
  bool? mirage;
  CloudflareRequestInitPolish? polish;
  String? resolveOverride;

  CloudflareRequestInit({
    this.cacheEverything,
    this.cacheKey,
    this.cacheTags,
    this.cacheTtl,
    this.cacheTtlByStatus,
    this.scrapeShield,
    this.apps,
    this.image,
    this.minify,
    this.mirage,
    this.polish,
    this.resolveOverride,
  });
}

extension CloudflareRequestInitExtension on CloudflareRequestInit {
  interop.CloudflareRequestInit get delegate {
    return interop.CloudflareRequestInit()
      ..cacheEverything = cacheEverything
      ..cacheKey = cacheKey
      ..cacheTags = cacheTags
      ..cacheTtl = cacheTtl
      ..cacheTtlByStatus = cacheTtlByStatus
      ..scrapeShield = scrapeShield
      ..apps = apps
      ..image = image?.delegate
      ..minify = minify?.delegate
      ..mirage = mirage
      ..polish = polish?.name
      ..resolveOverride = resolveOverride;
  }
}

class CloudflareRequestInitImageMinify {
  bool? javascript;
  bool? css;
  bool? html;

  CloudflareRequestInitImageMinify({
    this.javascript,
    this.css,
    this.html,
  });
}

extension CloudflareRequestInitImageMinifyExtension
    on CloudflareRequestInitImageMinify {
  interop.RequestInitCfPropertiesImageMinify get delegate {
    return interop.RequestInitCfPropertiesImageMinify()
      ..javascript = javascript
      ..css = css
      ..html = html;
  }
}

class BasicImageTransformations {
  num? width;
  num? height;
  BasicImageTransformationsFit? fit;
  BasicImageTransformationsGravity? gravity;
  String? background;
  int? rotate;

  BasicImageTransformations({
    this.width,
    this.height,
    this.fit,
    this.gravity,
    this.background,
    this.rotate,
  });
}

class CloudflareRequestInitImageDraw extends BasicImageTransformations {
  String url;
  num? opacity;
  CloudflareRequestInitImageDrawRepeat? repeat;
  num? top;
  num? left;
  num? bottom;
  num? right;

  CloudflareRequestInitImageDraw({
    required this.url,
    this.opacity,
    this.repeat,
    this.top,
    this.left,
    this.bottom,
    this.right,
    super.width,
    super.height,
    super.fit,
    super.gravity,
    super.background,
    super.rotate,
  });
}

extension CloudflareRequestInitImageDrawExtension
    on CloudflareRequestInitImageDraw {
  interop.RequestInitCfPropertiesImageDraw get delegate {
    return interop.RequestInitCfPropertiesImageDraw(url: url)
      ..opacity = opacity
      ..repeat = repeat == CloudflareRequestInitImageDrawRepeat.valueTrue
          ? true
          : repeat?.name
      ..top = top
      ..left = left
      ..bottom = bottom
      ..right = right
      ..width = width
      ..height = height
      ..fit = fit?.value
      ..gravity = gravity?.name
      ..background = background
      ..rotate = rotate;
  }
}

enum BasicImageTransformationsFit {
  scaleDown('scale-down'),
  contain('contain'),
  cover('cover'),
  crop('crop'),
  pad('pad');

  final String value;
  const BasicImageTransformationsFit(this.value);
}

enum BasicImageTransformationsGravity {
  left,
  right,
  top,
  bottom,
  center,
  auto,
  // cordinates?
}

enum CloudflareRequestInitImageDrawRepeat {
  valueTrue,
  x,
  y,
}

enum CloudflareRequestInitPolish {
  lossy,
  lossless,
  off,
}
