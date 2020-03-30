import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Total Flex',
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController etanolController = TextEditingController();
  TextEditingController tanqueCombustivelController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _msg1 = "Informe os Dados";
  var _msg2 = "";

  void _limpar() {
    gasolinaController.text = "";
    etanolController.text = "";
    tanqueCombustivelController.text = "";
    setState(() {
      _msg1 = "Informe os Dados";
      _msg2 = "";
    });
  }

  void _calcular() {
    double gasolina = double.parse(gasolinaController.text);
    double etanol = double.parse(etanolController.text);
    double tanque = double.parse(tanqueCombustivelController.text);

    double res = etanol / gasolina;

    setState(() {
      if (res < 0.74) {
        _msg1 = "Abasteça com Etanol";
        _msg2 =
            "Você pagará RS ${(etanol * tanque).toStringAsFixed(2)}\npara encher seu tanque.";
      } else {
        _msg1 = "Abasteça com Gasolina";
        _msg2 =
            "Você pagará RS ${(gasolina * tanque).toStringAsFixed(2)}\npara encher seu tanque.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Total Flex',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: _limpar,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: Icon(
                      Icons.local_gas_station,
                      color: Color(0xFF616161),
                      size: 120.0,
                    ),
                  ),
                ),
                Container(
                  width: 500.0,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor da Gasolina (Reais):",
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    controller: gasolinaController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Informe o Valor da Gasolina";
                      } else
                        return null;
                    },
                  ),
                ),
                Container(
                  width: 500.0,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor do Etanol (Reais):",
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    controller: etanolController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Informe o Valor da Gasolina";
                      } else
                        return null;
                    },
                  ),
                ),
                Container(
                  width: 500.0,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Tanque Combustivel(litros):",
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    controller: tanqueCombustivelController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Informe a Capacidade do Tanque de Combustível";
                      } else
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calcular();
                      }
                    },
                    color: Colors.pink,
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  "$_msg1",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$_msg2",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
