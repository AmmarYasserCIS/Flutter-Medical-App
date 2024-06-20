import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalapp/features/login/data/cubit/login_state.dart';
import 'package:medicalapp/features/login/data/models/login_request_body.dart';
import 'package:medicalapp/features/login/data/models/login_response.dart';

import '../repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    final response = await loginRepo.login(loginRequestBody);
    response.when(success: (LoginResponse) {
      emit(LoginState.success(LoginResponse));
    }, failure: (error) {
      emit(LoginState.falure(error: error.apiErrorModel.message ?? ''));
    });
  }
}
