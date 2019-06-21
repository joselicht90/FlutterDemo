// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String codigo;
    String mensaje;
    String usuarioId;
    String identificacion;
    String descripcion;
    String siValido;
    List<String> actividadesPermitidas;
    String tokenSession;
    String fechaExpiracionTokenSession;
    String avatar;
    String email;
    String telefono;
    int documento;
    String apellido;
    String nombre;
    dynamic cuit;
    dynamic razonSocial;
    bool esAcreedor;

    LoginResponse({
        this.codigo,
        this.mensaje,
        this.usuarioId,
        this.identificacion,
        this.descripcion,
        this.siValido,
        this.actividadesPermitidas,
        this.tokenSession,
        this.fechaExpiracionTokenSession,
        this.avatar,
        this.email,
        this.telefono,
        this.documento,
        this.apellido,
        this.nombre,
        this.cuit,
        this.razonSocial,
        this.esAcreedor,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => new LoginResponse(
        codigo: json["Codigo"] == null ? null : json["Codigo"],
        mensaje: json["Mensaje"] == null ? null : json["Mensaje"],
        usuarioId: json["UsuarioID"] == null ? null : json["UsuarioID"],
        identificacion: json["Identificacion"] == null ? null : json["Identificacion"],
        descripcion: json["Descripcion"] == null ? null : json["Descripcion"],
        siValido: json["SiValido"] == null ? null : json["SiValido"],
        actividadesPermitidas: json["ActividadesPermitidas"] == null ? null : new List<String>.from(json["ActividadesPermitidas"].map((x) => x)),
        tokenSession: json["TokenSession"] == null ? null : json["TokenSession"],
        fechaExpiracionTokenSession: json["FechaExpiracionTokenSession"] == null ? null : json["FechaExpiracionTokenSession"],
        avatar: json["Avatar"] == null ? null : json["Avatar"],
        email: json["Email"] == null ? null : json["Email"],
        telefono: json["Telefono"] == null ? null : json["Telefono"],
        documento: json["Documento"] == null ? null : json["Documento"],
        apellido: json["Apellido"] == null ? null : json["Apellido"],
        nombre: json["Nombre"] == null ? null : json["Nombre"],
        cuit: json["Cuit"],
        razonSocial: json["RazonSocial"],
        esAcreedor: json["EsAcreedor"] == null ? null : json["EsAcreedor"],
    );

    Map<String, dynamic> toJson() => {
        "Codigo": codigo == null ? null : codigo,
        "Mensaje": mensaje == null ? null : mensaje,
        "UsuarioID": usuarioId == null ? null : usuarioId,
        "Identificacion": identificacion == null ? null : identificacion,
        "Descripcion": descripcion == null ? null : descripcion,
        "SiValido": siValido == null ? null : siValido,
        "ActividadesPermitidas": actividadesPermitidas == null ? null : new List<dynamic>.from(actividadesPermitidas.map((x) => x)),
        "TokenSession": tokenSession == null ? null : tokenSession,
        "FechaExpiracionTokenSession": fechaExpiracionTokenSession == null ? null : fechaExpiracionTokenSession,
        "Avatar": avatar == null ? null : avatar,
        "Email": email == null ? null : email,
        "Telefono": telefono == null ? null : telefono,
        "Documento": documento == null ? null : documento,
        "Apellido": apellido == null ? null : apellido,
        "Nombre": nombre == null ? null : nombre,
        "Cuit": cuit,
        "RazonSocial": razonSocial,
        "EsAcreedor": esAcreedor == null ? null : esAcreedor,
    };
}
