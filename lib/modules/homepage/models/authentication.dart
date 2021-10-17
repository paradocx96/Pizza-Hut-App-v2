

import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'http_exception.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier
{

  Future<void> signUp(String email, String password) async
  {
    print("------------- SIGN UP ---------------  ");
    String backendAPI = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCPOLM57vHBoeIYnzTDZcp36D0_nNqAM_8';

    final Uri url = Uri.parse(backendAPI);

    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password': password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
      print(responseData);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }

    } catch (error)
    {
      throw error;
    }

  }

  Future<void> logIn(String email, String password) async
  {
    print("------------- SIGN IN ---------------  ");
    const backendAPI = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCPOLM57vHBoeIYnzTDZcp36D0_nNqAM_8';
    final Uri url = Uri.parse(backendAPI);

    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
     print(responseData);

    } catch(error)
    {
      throw error;
    }

  }
}