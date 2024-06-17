import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';


@freezed
class LoginState<T> with _$LoginState<T>{
  const factory LoginState.initial()= _Initial;
  const factory LoginState.loading()= Loading;
  const factory LoginState.Success(T data)=Success<T>;
  const factory LoginState.falure({required String error})=Error;
}