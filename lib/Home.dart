import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool =TextEditingController();
  TextEditingController _controllerGasolina =TextEditingController();

  String _textResultado="";

  void _calcular(){
   double precoAlcool= double.tryParse(_controllerAlcool.text);
   double precoGasolina= double.tryParse(_controllerGasolina.text);
   if(precoAlcool==null || precoGasolina==null){
     setState(() {
       _textResultado= "Verifique o numero digitado";
     });

   }else{

     if( (precoAlcool/precoGasolina)>=0.7){

       setState(() {
         _textResultado= "Melhor abastecer com gasolina";
       });
     }else{
       setState(() {
         _textResultado= "Melhor abastecer com alcool";
       });

     }
     _limparCampos();
   }


  }

  void _limparCampos(){
    _controllerGasolina.text="";
    _controllerAlcool.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste de alcool de gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding (
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("./lib/images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("Saiba qual melhor opção abstecimento do seu carro!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59"),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(" Calcular",
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("Resultado: "+_textResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
