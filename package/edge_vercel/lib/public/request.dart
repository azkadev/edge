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
import 'package:typings/core.dart' as interop;

import 'package:edge_dart_runtime/request.dart';
import '../interop/request_interop.dart';

extension VercelEdgeRequestExtension on Request {
  IncomingRequestVercelProperties get vc =>
      IncomingRequestVercelProperties._(delegate);
}

class IncomingRequestVercelProperties {
  final interop.Request _delegate;

  IncomingRequestVercelProperties._(this._delegate);

  String? get ipAddress => _delegate.ipAddress;
  String? get city => _delegate.city;
  String? get country => _delegate.country;
  String? get region => _delegate.region;
  String? get countryRegion => _delegate.countryRegion;
  String? get latitude => _delegate.latitude;
  String? get longitude => _delegate.longitude;
}
