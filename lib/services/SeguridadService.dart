import 'dart:convert';
import 'package:flutter_demo/models/LoginRequest.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_demo/models/LoginResponse.dart';

Future<LoginResponse> login(String user, String pass, String estructura) async{
  final String url = 'http://192.168.128.21/TGP.WSS.API_desa/api/seguridad/loginmobile';
  final LoginRequest request = new LoginRequest(codigoEstructuraFuncional: estructura, contrasena: pass,nombreUsuario: user);
  final String jsonRequest = loginRequestToJson(request);
  return http.post(url,body: jsonRequest, headers: {"Content-Type": "application/json"}).then((http.Response response){
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      throw new Exception("Error while fetching data");
    }
    return LoginResponse.fromJson(json.decode(response.body));
  });
}
