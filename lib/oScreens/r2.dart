import 'dart:io';

import 'package:cloudflare_r2_uploader/cloudflare_r2_uploader.dart';

class R2Service {




  static Future<String> uploadImage(File file) async {
    try {
      final String key = "pet_${DateTime.now().millisecondsSinceEpoch}.jpg";
      final fileBytes = await file.readAsBytes();
      final uploader = CloudflareR2Uploader(
          accountId: "ee45a8b4ea3582c0dd04eadacd156d1e",
          accessKeyId: "5033f8f65049d79d7a9f1adceaecea58",
          secretAccessKey: "57ae9d11cf898cfafe556c459b3576fbaac0ef6b4cad47f0d2fec6fcb271637b",
          bucketName: 'vetbookr'
      );
      final url = await uploader.uploadFile(
        fileBytes: fileBytes,
        fileName: key,
        folderName: 'pets',
        onProgress: (progress) =>
            print('Upload Progress: ${(progress * 100).toStringAsFixed(0)}%'),
      );

      if (url != null) {
        print('✅ File uploaded successfully: $url');

      } else {
        print('❌ Upload failed');
      }
      return "https://cdn.vetbookr.digitopia.live/pets/$key";
      // public url (depends on your R2 public domain)

    } catch (e) {
      print("R2 Upload Error: $e");
      return "null";
    }
  }
}