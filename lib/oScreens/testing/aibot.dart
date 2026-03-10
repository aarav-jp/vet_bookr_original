import 'dart:convert';
import 'package:http/http.dart' as http;

/// NOTE:
/// - Android emulator -> use http://10.0.2.2:11434
/// - iOS simulator -> usually http://localhost:11434 works
/// - Real device -> use your PC's LAN IP, e.g. http://192.168.1.50:11434
class OllamaClient {
  final Uri baseUri;

  OllamaClient(String baseUrl) : baseUri = Uri.parse(baseUrl);

  /// Non-streaming chat call.
  /// Uses: POST /api/chat
  Future<String> chat({
    required String model,
    required List<Map<String, String>> messages,
    Map<String, dynamic>? options,
    bool keepAlive = true,
  }) async {
    final url = baseUri.replace(path: '/api/chat');

    final payload = <String, dynamic>{
      'model': model,
      'messages': messages,
      'stream': false,
      if (options != null) 'options': options,
      // Optional: keep model in memory (Ollama supports keep_alive on some endpoints/versions)
      if (keepAlive) 'keep_alive': '5m',
    };

    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('Ollama error ${res.statusCode}: ${res.body}');
    }

    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final msg = data['message'] as Map<String, dynamic>?;
    final content = msg?['content']?.toString() ?? '';
    return content;
  }

  /// Streaming chat: yields partial tokens as they arrive.
  /// Uses: POST /api/chat with stream=true
  Stream<String> chatStream({
    required String model,
    required List<Map<String, String>> messages,
    Map<String, dynamic>? options,
  }) async* {
    final url = baseUri.replace(path: '/api/chat');

    final payload = <String, dynamic>{
      'model': model,
      'messages': messages,
      'stream': true,
      if (options != null) 'options': options,
    };

    final req = http.Request('POST', url)
      ..headers['Content-Type'] = 'application/json'
      ..body = jsonEncode(payload);

    final streamed = await req.send();

    if (streamed.statusCode < 200 || streamed.statusCode >= 300) {
      final errBody = await streamed.stream.bytesToString();
      throw Exception('Ollama error ${streamed.statusCode}: $errBody');
    }

    // Ollama streams JSON objects separated by newlines.
    final lines = streamed.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter());

    await for (final line in lines) {
      if (line
          .trim()
          .isEmpty) continue;

      final obj = jsonDecode(line) as Map<String, dynamic>;

      // When done, Ollama includes: {"done": true, ...}
      if (obj['done'] == true) break;

      final msg = obj['message'] as Map<String, dynamic>?;
      final chunk = msg?['content']?.toString() ?? '';

      if (chunk.isNotEmpty) yield chunk;
    }
  }
}