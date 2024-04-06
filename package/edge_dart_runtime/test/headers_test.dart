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
import 'package:edge_dart_runtime/edge_dart_runtime.dart';
import 'package:test/test.dart';

void main() {
  group('Headers', () {
    test('Headers()', () {
      expect(Headers()['foo'], null);
      expect(Headers({'foo': 'bar'})['foo'], 'bar');
    });

    test('.has()', () {
      expect(Headers().has('foo'), false);
      expect(Headers({'foo': 'bar'}).has('foo'), true);
    });

    test('.append()', () {
      final headers = Headers({'foo': 'bar'})..append('foo', 'baz');
      expect(headers['foo'], 'bar, baz');
    });

    test('.keys()', () {
      final headers = Headers({'foo': 'bar'});
      expect(headers.keys.toList(), ['foo']);
    });

    test('.delete()', () {
      final headers = Headers({'foo': 'bar'})..delete('foo');
      expect(headers['foo'], null);
    });

    test('setter', () {
      final headers = Headers({'foo': 'bar'});
      headers['bar'] = 'baz';
      expect(headers['foo'], 'bar');
      expect(headers['bar'], 'baz');
    });

    test('getter', () {
      final headers = Headers({'foo': 'bar'});
      expect(headers['foo'], 'bar');
    });
  });
}
