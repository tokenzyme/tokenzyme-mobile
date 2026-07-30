import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> uploadFile(File file, String signedUrl) async {
  http.Response response = await http.put(
    Uri.parse(signedUrl),
    headers: <String, String>{'x-amz-acl': 'public-read'},
    body: await file.readAsBytes(),
  );
  if (response.statusCode != 200) {
    throw Exception('Error uploading file');
  }
}
