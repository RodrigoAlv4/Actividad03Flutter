import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:actividad3/json/animalitos.dart';
import 'package:actividad3/themes/colores.dart';

class detalle extends StatefulWidget {
  const detalle({Key? key, this.animalitos}) : super(key: key);
//Esta variable se usara para mostrar cada una de las canciones
  final dynamic animalitos;

  @override
  State<detalle> createState() => _detalleState();
}

class _detalleState extends State<detalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primario,
      body: Contenido(),
    );
  }

  Widget Contenido() {
    //Variable tamaño, que recibe la data a travez
    //de la MediaQuery.Of
    var tamanio = MediaQuery.of(context).size;
    List audiosAnimals = widget.animalitos['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: tamanio.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.animalitos['img']),
                        fit: BoxFit.cover)),
              ), //ESPACIO
              SizedBox(
                height: 30,
              ),
              //FILAS - PARA TITULO DE ALBUM Y TITULO DE CANCIONES
              Padding(
                //MARGEN EN LA PANTALLA
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.animalitos['title'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: purpura)),
                    //BTN SEGUIR
                    Container(
                      decoration: BoxDecoration(
                          color: celeste,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 10, bottom: 10),
                        child: Text(
                          "Favoritos",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //ESTA COLUMNA CONTENDRA LA LISTA DE CANCIONES
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: List.generate(audiosAnimals.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10),
                      child: GestureDetector(
                        //EVENTO
                        onTap: () {},
                        child: Row(
                          children: [
                            Container(
                              //CALCULO A BASE DE LAS CANCIONES EN JSON
                              width: 180,
                              height: 50,
                              //decoration: BoxDecoration(color: primario),
                              //llamamos el titulo de las canciones
                              child: Text(
                                "${index + 1}. " +
                                    audiosAnimals[index]['title'],
                                style: TextStyle(color: gris, fontSize: 12),
                              ),
                            ), //CONTIENE DURACION DE CANCION
                            Container(
                              width: 150,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    audiosAnimals[index]['duration'],
                                    style: TextStyle(color: gris, fontSize: 12),
                                  ),
                                  //BOTON PLAY
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: purpura.withOpacity(0.8)),
                                    child: Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: primario,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          //FILA PARA BOTON DE REGRESO
          SafeArea(
            child: Row(
              //AJUSTAMOS LA POSICION-ESPACIADO
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: purpura,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
