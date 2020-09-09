import 'package:appemergencia/login/registrar/registrar_controller.dart';
import 'package:appemergencia/utils/flutter/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

Utils utils = new Utils();

class Registrar extends StatelessWidget {
  const Registrar({Key key}) : super(key: key);
  final String nro_contrato = "";

//final Registro registro = new Registro();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrarController>(
        init: RegistrarController(),
        builder: (_) {
          return SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey.shade200,
              child: Text(
                "Registrar",
                style: Theme.of(context).textTheme.title.copyWith(),
              ),
            ),
            Container(
              child: Card(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                elevation: 11,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    _.setRegistroNroContrato(val != "" ? int.parse(val) : null);
                  },
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black26,
                      ),
                      hintText: "Número de contrato",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0)),
                ),
              ),
            ),
            Obx(() => _.validar_form(
                        "vacio", _.registro.numero_contrato.toString()) !=
                    null
                ? Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Text(
                          _.validar_form(
                              "vacio", _.registro.numero_contrato.toString()),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ),
                  )
                : SizedBox(
                    height: 0,
                  )),
            Container(
              child: Card(
                margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                elevation: 11,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {
                    _.setRegistroEmail(val.toString());
                  },
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black26,
                      ),
                      hintText: "Correo",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0)),
                ),
              ),
            ),
            Obx(() =>
                _.validar_form("vacio|email", _.registro.email.toString()) !=
                        null
                    ? Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Text(
                              _
                                  .validar_form("vacio|email", _.registro.email)
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    : SizedBox(
                        height: 10,
                      )),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 11.0, right: 30.0, left: 30.0, bottom: 30),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                color: Colors.blueGrey,
                onPressed: () async {
                  if (_.validar_form(
                              "vacio|email", _.registro.email.toString()) ==
                          null &&
                      _.validar_form(
                              "vacio", _.registro.numero_contrato.toString()) ==
                          null) {
                    utils.dialogLoadingData(Icons.check_circle, Colors.green,
                        "Cargando...", context);
                        Future.delayed(Duration(seconds: 2),(){
                          utils.cerrarDialogGlobal(context);
                        });
                  }
                },
                elevation: 11,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Text("Enviar",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ]));
        });
  }
}
