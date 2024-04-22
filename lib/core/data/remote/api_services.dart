import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dr_scan_graduation_project/core/data/errors/exceptions.dart';
import 'package:dr_scan_graduation_project/core/data/remote/network_checker.dart';

class ApiServices {
  ApiServices(this.networkChecker);
  NetworkChecker networkChecker;

  Future<dynamic> getData(String endpoint,
      {Map<String, String>? headers}) async {
    bool isConnected = await networkChecker.isConnected();
    if (isConnected == true) {
      final url = Uri.parse(endpoint);
      final response = await http.get(url, headers: headers);
      final responseBody = fetchData(response);
      return responseBody;
    } else {
      throw NetworkException();
    }
  }

  Future<dynamic> postData(String endpoint,
      {dynamic body, Map<String, String>? headers}) async {
    bool isConnected = await networkChecker.isConnected();
    if (isConnected == true) {
      // final headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
      final url = Uri.parse(endpoint);
      final response = await http.post(url, body: body, headers: headers);
      print(response.statusCode);
      final responseBody = await fetchData(response);
      return responseBody;
    } else {
      throw NetworkException();
    }
  }

  Future<dynamic> postFile(String endpoint, String filePath) async {
    bool isConnected = await networkChecker.isConnected();
    if (isConnected == true) {
      final url = Uri.parse(endpoint);
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        filePath,
      ));
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      return jsonDecode(responseBody);
    } else {
      throw NetworkException();
    }
  }

  Future fetchData(http.Response response) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 302) {
      final redirectUrl = response.headers['location'];
      final redirectResponse = await http.get(Uri.parse(redirectUrl!));
      if (redirectResponse.statusCode == 200) {
        return jsonDecode(redirectResponse.body);
      } else {
        throw ServerException();
      }
    } else if (response.statusCode == 400) {
      throw BadRequestException();
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else if (response.statusCode == 403) {
      throw ForbiddenException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw InternalServerErrorException();
    } else {
      throw ServerException();
    }
  }
}


  // uploadImageToServer(File image, String endpoint) async {
  //   var stream = http.ByteStream(DelegatingStream(image.openRead()));
  //   var length = await image.length();
  //   var uri = Uri.parse(endpoint);
  //   var request = http.MultipartRequest("POST", uri);
  //   var multipartFile = http.MultipartFile('file', stream, length,
  //       filename: basename(image.path));

  //   request.files.add(multipartFile);
  //   http.StreamedResponse response = await request.send();
  //   var responseString = await response.stream.bytesToString();
  //   final data = jsonDecode(responseString);
  //   // final result = data['result'];
  //   return data;
  // }