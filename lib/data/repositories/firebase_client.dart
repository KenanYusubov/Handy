import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import '../exceptions/exceptions.dart';

Future<T> makeAndCheckRequest<T>(Future<T> Function() requestBody) async {
  try {
    T result = await requestBody();
    return result;
  } on HttpException {
    throw HandyHttpException();
  } on PlatformException {
    throw HandyPlatformException();
  } catch (_) {
    throw HandyException();
  }
}
