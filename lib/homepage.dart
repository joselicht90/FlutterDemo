import 'package:flutter/material.dart';
import 'mydrawer.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facturasPorCobrar = Container(
      margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
      child: Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Facturas por Cobrar',
                            style:
                                TextStyle(color: Colors.green, fontSize: 18)),
                        Text('\$9.999.999',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 34.0)),
                      ],
                    ),
                    Container(
                      height: 60.0,
                      child: Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.timeline,
                                color: Colors.white, size: 30.0),
                          ))),
                    ),
                  ]),
              ButtonTheme.bar(
                padding: EdgeInsets.only(
                    top:
                        20), // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('BUSCAR'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    final pagosRecibidos = Container(
      margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
      child: Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Pagos del Ejercicio',
                            style:
                                TextStyle(color: Colors.green, fontSize: 18)),
                        Text('\$9.999.999',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 34.0)),
                      ],
                    ),
                    Container(
                      height: 60.0,
                      child: Material(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.attach_money,
                                color: Colors.white, size: 30.0),
                          ))),
                    ),
                  ]),
              ButtonTheme.bar(
                padding: EdgeInsets.only(
                    top:
                        20), // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('BUSCAR'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
    
    Widget _buildPagoTipo(String fechaPago, String iaPgo, String jurisdiccion,{Function() onTap}) {
      return Container(
        padding: const EdgeInsets.all(5.0),
        width: 300,
        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 25.0),
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(12.0),
          shadowColor: Color(0x802196F3),
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: new BoxDecoration(
              border: Border(
                top: BorderSide(
                  //                   <--- left side
                  color: Colors.green[700],
                  width: 5.0,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text('Fecha de Pago:   ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          )),
                      Expanded(
                        child: Text(fechaPago,
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text('Importe Total:   ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          )),
                      Expanded(
                        child: Text(iaPgo,
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Jurisdiccion:   ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(jurisdiccion,
                        textAlign: TextAlign.start,
                        //softWrap: true,
                        overflow: TextOverflow.visible,
                        style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Playground'),
        elevation: 8.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              facturasPorCobrar,
              pagosRecibidos,
              Divider(
                color: Colors.grey,
                height: 2,
              ),
              Text(
                'Ultimos Pagos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              
              Container(
                //color: Colors.green,
                height: 200,
                //margin: const EdgeInsets.only(bottom: ),
                child: SizedBox(
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    children: <Widget>[
                      _buildPagoTipo('01/01/2019', '\$9.999',
                          'TESORERIA GRAL DE LA PROVINCIA DE BS AS. ORGANISMO DE LA CONSTITUCION'),
                      _buildPagoTipo('01/01/2019', '\$9.999',
                          'TESORERIA GRAL DE LA PROVINCIA DE BS AS'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}