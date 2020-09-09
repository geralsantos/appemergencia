
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
class RxRegistro{
  final RxInt numero_contrato;
  final RxString email;
  RxRegistro({@required this.numero_contrato,@required this.email});
}
class Registro {
  RxRegistro rx;

  Registro({@required int numero_contrato,@required String email}){
    this.rx = RxRegistro(numero_contrato: numero_contrato.obs, email: email.obs);
  }

  int get numero_contrato => this.rx.numero_contrato.value;
  String get email => this.rx.email.value;

  set numero_contrato(int numero_contrato){
    this.rx.numero_contrato.value = numero_contrato;
  }
  set email(String email){
    this.rx.email.value = email;
  }
  static Registro fromJson(Map<String, dynamic> json){
    return Registro(
      numero_contrato: json["numero_contrato"],
      email: json["email"]
    );
  }
}