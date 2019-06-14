import 'package:flutter/material.dart';
import 'package:flutter_demo/mydrawer.dart';
import 'dart:async';

class SearchFacturas extends StatefulWidget {
  @override
  _SearchFacturas createState() => _SearchFacturas();
}

class _SearchFacturas extends State<SearchFacturas> {
  final List<String> tiposFacturas = ['A', 'B', 'C', 'E'];

  String _valueDate = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2038));
    if (picked != null) setState(() => _valueDate = picked.toString());
  }

  var _value = "A";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Facturas'),
        elevation: 8.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tipo Factura',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      textAlign: TextAlign.start,
                    ),
                    DropdownButton<String>(
                      items: tiposFacturas
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      value: _value,
                      isExpanded: true,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Punto de Emisión',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                            textAlign: TextAlign.start,
                          ),
                          TextField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'N° Factura',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                            textAlign: TextAlign.start,
                          ),
                          TextField(
                            maxLength: 8,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Fecha de Emisión',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                            textAlign: TextAlign.start,
                          ),
                          InkWell(
                            onTap: () {
                              _selectDate(); // Call Function that has showDatePicker()
                            },
                            child: IgnorePointer(
                              child: new TextFormField(
                                initialValue: _valueDate,
                                key: Key('fechaDesde'),
                                decoration:
                                    new InputDecoration(hintText: 'Desde:'),
                                maxLength: 10,
                                // validator: validateDob,
                                onSaved: (String val) {
                                  setState(() {
                                    _valueDate = val;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
