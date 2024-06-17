import 'package:medicalapp/core/networking/api_error_handler.dart';
import 'package:medicalapp/core/networking/api_service.dart';
import 'package:medicalapp/features/login/data/models/login_request_body.dart';
import 'package:medicalapp/features/login/data/models/login_response.dart';

import '../../../../core/networking/api_result.dart';

class LoginRepo{
  final ApiService apiService;
  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponse>>login(
      LoginRequestBody loginRequestBody
      )async {
    try{
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);

    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}