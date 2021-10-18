import 'package:flutter/material.dart';

class FuelApp extends StatefulWidget {
  @override
  _FuelAppState createState() => _FuelAppState();
}

class _FuelAppState extends State<FuelApp> {
  TextEditingController _controllerEtanol = TextEditingController();
  TextEditingController _controllerGasoline = TextEditingController();

  void _calculate() {
    double priceEtanol = double.tryParse(_controllerEtanol.text);
    double priceGasoline = double.tryParse(_controllerGasoline.text);
    String _textResult = "";

    if (priceEtanol == null || priceGasoline == null) {
      setState(() {
        _textResult =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if ((priceEtanol / priceGasoline) >= 0.7) {
        setState(() {
          _textResult = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textResult = "Melhor abastecer com Alcool";
        });
      }

      _clearFields();
    }
  }

  _clearFields() {
    _controllerEtanol.text = "";
    _controllerGasoline.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("assets/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Alcool, ex: 1.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerEtanol,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, ex: 3.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasoline,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _calculate),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "${_textResult}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
