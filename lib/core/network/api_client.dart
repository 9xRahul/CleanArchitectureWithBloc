import 'package:clean_architecture_with_bloc/core/api_urls/api_urls.dart';
import 'package:clean_architecture_with_bloc/core/error/api_exceptions.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<dynamic> postApi(dynamic data) async {
    try {
      final response = await dio.post(ApiUrls.loginUrl, data: data);
      print("code${response.statusCode}");
      final responseData = getResponseData(response);

      return responseData;
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode ?? 0;
        final data = e.response!.data;

        String message = "Unknown error";

        if (data is Map && data['message'] != null) {
          message = data['message'];
        }

        throw InvalidCredentialsException(message, statusCode);
      }

      throw NetworkException();
    }
  }

  dynamic getResponseData(Response<dynamic> response) {
    print("code${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        var dataToBeReturn = response.data;
        return dataToBeReturn;
      case 400:
        var dataToBeReturn = response.data;
        print(dataToBeReturn['message']);
        return dataToBeReturn;
    }
  }
}

class ApiException {}
