import 'dart:convert';

import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:flutter/material.dart';

import "../../../models/user.dart";
import 'package:http/http.dart' as http;

class AuthService {
  void signupUser(
      {required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        cart: [],
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorhandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account is created Successfully, Login with the same credentials !',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorhandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account is created Successfully, Login with the same credentials !',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
