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
  group('Request', () {
    test('.method', () {
      final resource = Resource('https://foo.com');

      expect(
        Request(resource).method,
        'GET',
        reason: 'The default method is should be GET',
      );

      expect(Request(resource, method: 'GET').method, 'GET');
      expect(Request(resource, method: 'POST').method, 'POST');
      expect(Request(resource, method: 'OPTIONS').method, 'OPTIONS');
    });

    test('.url', () {
      // Browser adds a / to the path if empty
      final uri = Uri.parse('https://foo.com/');
      final resource = Resource.uri(uri);

      expect(Request(resource).url, uri);
      expect(Request(Resource('https://foo.com?foo=bar')).url.queryParameters, {
        'foo': 'bar',
      });
    });

    test('.headers', () {
      final request = Request(
        Resource(
          'https://foo.com',
        ),
        headers: Headers({
          'foo': 'bar',
        }),
      );

      expect(request.headers.get('foo'), 'bar');
    });

    test('.destination', () {
      final request = Request(Resource('https://foo.com'));
      expect(request.destination, RequestDestination.empty);
    });

    test('.destination', () {
      final request = Request(
        Resource('https://foo.com'),
        referrer: 'https://example.com',
      );

      expect(request.referrer.isNotEmpty, true);
    });

    test('.referrerPolicy', () {
      final request = Request(
        Resource('https://foo.com'),
        referrerPolicy: ReferrerPolicy.origin,
      );

      expect(request.referrerPolicy, ReferrerPolicy.origin);
    });

    test('.mode', () {
      final request = Request(
        Resource('https://foo.com'),
        mode: RequestMode.cors,
      );

      expect(request.mode, RequestMode.cors);
    });

    test('.mode', () {
      final request = Request(
        Resource('https://foo.com'),
        credentials: RequestCredentials.sameOrigin,
      );

      expect(request.credentials, RequestCredentials.sameOrigin);
    });

    test('.cache', () {
      final request = Request(
        Resource('https://foo.com'),
        cache: RequestCache.noStore,
      );

      expect(request.cache, RequestCache.noStore);
    });

    test('.redirect', () {
      final request = Request(
        Resource('https://foo.com'),
        redirect: RequestRedirect.error,
      );

      expect(request.redirect, RequestRedirect.error);
    });

    test('.destination', () {
      final request = Request(
        Resource('https://foo.com'),
        integrity: 'foo',
      );

      expect(request.integrity, 'foo');
    });

    test('.keepalive', () {
      final request = Request(Resource('https://foo.com'));

      final request2 = Request(
        Resource('https://foo.com'),
        keepalive: true,
      );

      expect(request.keepalive, false);
      expect(request2.keepalive, true);
    });

    test('.signal', () {
      final request = Request(Resource('https://foo.com'));

      // Forces it through to make sure it comes from the correct delegate.
      // ignore: unnecessary_type_check
      expect(request.signal is AbortSignal, true);
    });

    test('.bodyUsed', () async {
      final request = Request(
        Resource(
          'https://foo.com',
        ),
        method: 'POST',
        body: 'foo',
      );
      expect(request.bodyUsed, false);
      expect(await request.text(), 'foo');
      expect(request.bodyUsed, true);
    });

    test('.clone()', () async {
      final request = Request(Resource('https://foo.com'));
      final clone = request.clone();
      expect(request.url.toString(), clone.url.toString());
    });

    // TODO body
    // TODO formData
    // TODO json

    test('.text()', () async {
      final request = Request(
        Resource(
          'https://foo.com',
        ),
        method: 'POST',
        body: 'foo',
      );

      expect(await request.text(), 'foo');
    });
  });
}
