import 'dart:convert';
import 'package:http/http.dart';
import 'package:ubongo/common/configs/configuration.dart';
import 'package:ubongo/common/constants/http_constants.dart';
import 'package:ubongo/common/utils/http_utils.dart';

class HttpClient {
  Client? client;
  String host;
  Map<String, String>? header;

  HttpClient({
    required this.host,
     this.client,
     this.header
  }) {
    client;
  }

  factory HttpClient.setVideosAPIhost() => HttpClient(
        host: Configuration.host,
      );

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  Map<String, String> _generateAuthorizationHeader() => {
        HttpConstants.authorization: HttpConstants.authorizationValue,
        HttpConstants.contentType: HttpConstants.jsonContentType
      };

  Map<String, String> _generateRequestHeader([
    Map<String, String> overrideHeader = const {},
  ]) =>
      {
        ..._generateAuthorizationHeader(),
        ...overrideHeader,
      };

  dynamic get(String path) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client!.get(
      _getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic post(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client!.post(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType].toString()),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic patch(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client!.patch(
      _getParsedUrl(path),
      body: HttpUtil.encodeRequestBody(
          data, requestHeader[HttpConstants.contentType].toString()),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic put(String path, dynamic data) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client!.put(
      _getParsedUrl(path),
      body: json.encode(data),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(
      response,
    );
  }

  dynamic delete(String path) async {
    final requestHeader = _generateRequestHeader();

    final Response response = await client!.delete(
      _getParsedUrl(path),
      headers: requestHeader,
    );

    return HttpUtil.getResponse(response);
  }

  dynamic getImage(String url) async {
    final Response response = await client!.get(Uri.parse(url));
    return response;
  }
}
