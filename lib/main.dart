import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

            /*Facultad de Estudios Superiores Aragon
              David Ortiz Ortiz
              Temas Especiales de Programacion */

            main() => runApp(Sensores());

class Sensores extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Estado();
}

class Estado extends State{

  AccelerometerEvent acelerometro;   //Variable de sensores

  @override

  void initState(){
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event){
      setState(() {
        acelerometro = event;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Scaffold(appBar: AppBar(title: Text('Tarea Sensor Rojo'),), //AppBar


            body: Center( // Se crea contenedor en el centro del cuerpo
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text('X: ${acelerometro.x.round()}'), //Valor de X en el texto
                      padding: EdgeInsets.all(28.5),
                      margin: EdgeInsets.all(26),
                      height: 250,
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.red.withOpacity((10-acelerometro.x.round().abs())/10), //Se le da la opacidad al contenedor
                      ),
                    ),

                  ],)
            )
        )
    );
  }
}