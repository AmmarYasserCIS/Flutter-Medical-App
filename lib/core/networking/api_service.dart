import 'package:dio/dio.dart';
import 'package:medicalapp/features/login/data/models/login_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:medicalapp/core/networking/api_constants.dart';

import '../../features/login/data/models/login_response.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService{
  factory ApiService(Dio dio,{String baseUrl})= _ApiService;
  
  @POST(ApiConstants.login)
  Future<LoginResponse>login(@Body()LoginRequestBody loginRequestBody);
}