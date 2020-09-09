
import 'package:appemergencia/app/Models/Registro.dart';
import 'package:appemergencia/utils/dart/validForm.dart'; 
import 'package:get/get.dart';

class RegistrarController extends GetxController{
  Registro registro =  Registro(email: "", numero_contrato: null);
  int maxLengthNroContrato = 18;
  int maxLengthEmail = 50;
  void setRegistroNroContrato(int val){
    registro.numero_contrato = val;
  } 
  void setRegistroEmail(String val){
    registro.email = val;
  } 
  bool isMaxLengthNroContrato(){
    print(registro.numero_contrato.toString().length);
    return registro.numero_contrato.toString().length > maxLengthNroContrato;
  }
  bool isMaxLengthEmail(){
    return registro.email.length > maxLengthEmail;
  }
  Future<bool> enviarRegistro(){

  }
  String validar_form(String tipo, String value){
    ValidForm validForm = new ValidForm();
    dynamic valid = tipo.split("|");
    String msjValidacion;
    for (var item in valid) {
    msjValidacion = null;
      switch (item) {
        case "vacio":
          if(value=="null" || value.isEmpty){
            msjValidacion = "El campo no puede ser vacio.";
          }
          break;
        case "email":
            if(!validForm.isEmail(value)){
              msjValidacion = "El correo es incorrecto";
            }
          break;
      }
      if(msjValidacion!=null){
        return msjValidacion;
      }
    }
  }
}