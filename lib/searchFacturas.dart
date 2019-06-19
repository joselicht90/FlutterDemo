import 'package:flutter/material.dart';
import 'package:flutter_demo/mydrawer.dart';
import 'package:date_format/date_format.dart';
import 'dart:async';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class SearchFacturas extends StatefulWidget {
  @override
  _SearchFacturas createState() => _SearchFacturas();
}

class _SearchFacturas extends State<SearchFacturas> {
  final List<String> tiposFacturas = ['TODAS', 'A', 'B', 'C', 'E'];

  String _valueDate = '';

  Future _selectDate() async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
        context: context,
        initialFirstDate: (new DateTime.now()).subtract(new Duration(days: 7)),
        initialLastDate: new DateTime.now(),
        firstDate: new DateTime(2015),
        lastDate: new DateTime(2020));
    if (picked != null && picked.length == 2) {
      setState(() => _valueDate =
          formatDate(picked[0], [dd, '/', mm, '/', yyyy]) +
              ' al ' +
              formatDate(picked[1], [dd, '/', mm, '/', yyyy]));
    }
    // DateTime picked = await showDatePicker(
    //     context: context,
    //     initialDate: new DateTime.now(),
    //     firstDate: new DateTime(2016),
    //     lastDate: new DateTime(2038));

    // if (picked != null) setState(() => _valueDate = formatDate(picked,[dd,'/',mm,'/',yyyy]));
  }

  var _value = "TODAS";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Facturas'),
        elevation: 8.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Tipo Factura',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.start,
                  ),
                  trailing: DropdownButton<String>(
                    iconSize: 40,
                    value: _value,
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
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Punto de Emisión',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: '....',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'N° Factura',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.start,
                  ),
                ),
                TextField(
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: '....',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Fecha de Emisión',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.start,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(); // Call Function that has showDatePicker()
                  },
                  child: IgnorePointer(
                      child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: '....',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                          controller: TextEditingController(text: _valueDate))),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xFF40a798),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Text("Buscar",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0)
                    .copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
