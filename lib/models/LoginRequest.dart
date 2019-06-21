// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
    String nombreUsuario;
    String contrasena;
    String codigoEstructuraFuncional;

    LoginRequest({
        this.nombreUsuario,
        this.contrasena,
        this.codigoEstructuraFuncional,
    });

    factory LoginRequest.fromJson(Map<String, dynamic> json) => new LoginRequest(
        nombreUsuario: json["NombreUsuario"],
        contrasena: json["Contrasena"],
        codigoEstructuraFuncional: json["CodigoEstructuraFuncional"],
    );

    Map<String, dynamic> toJson() => {
        "NombreUsuario": nombreUsuario,
        "Contrasena": contrasena,
        "CodigoEstructuraFuncional": codigoEstructuraFuncional,
    };
}
