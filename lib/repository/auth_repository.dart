import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:retrofit/http.dart';
import 'package:Garage/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:Garage/core/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// @RestApi(baseUrl: baseUrl)
// class AuthRepository {
//   Future<LoginModel?> login(String usrname, String password) async {
//     final endPint = baseUrl + '/userlogin';
//     debugPrint(endPint);
//     final apiUrl = Uri.parse(endPint);

//     try {
//       final response = await http.post(
//         apiUrl,
//         body: {'bemail': usrname, 'bpassword': password},
//       );
//       final loginRsponse = loginModelFromJson(response.body);
//       debugPrint(loginRsponse.toJson().toString());
//       return loginRsponse;
//     } on HttpException catch (e) {
//       debugPrint(e.message.toString());
//     }
//   }
// }
