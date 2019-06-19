import 'package:flutter/material.dart';
import 'mydrawer.dart';

class ResultadoBusqueda extends StatelessWidget {
  //final String title;

  Widget _buildFacturaTipo(String nroFactura, String importe, String juri,String estado,{Function() onTap}) {
    Color colorEstado = Colors.red;

    if(estado == 'P'){
      colorEstado = Colors.green;
    }
    else if(estado == 'I'){
      colorEstado = Colors.yellow;
    }
    else{
      colorEstado = Colors.red;
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8.0,
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              
              color: colorEstado,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        nroFactura,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Importe: ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '\$ '+importe,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Jurisdiccion: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: Text(
                        juri,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado Busqueda'),
        elevation: 8.0,
      ),
      body: ListView(
        children: <Widget>[
          _buildFacturaTipo('B-0001-00000001', '9.999.99,00', 'CAJA DE JUBILACIONES, SUBSIDIOS Y PENSIONES DEL PERSONAL DEL BANCO DE LA PROVINCIA DE BUEN', 'P'),
          _buildFacturaTipo('B-0001-00000002', '9.999.99,00', 'MINISTERIO DE ECONOMIA', 'I'),
          _buildFacturaTipo('B-0001-00000003', '9.999.99,00', 'INSTITUTO DE PREVISION SOCIAL (IPS)', 'X'),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
