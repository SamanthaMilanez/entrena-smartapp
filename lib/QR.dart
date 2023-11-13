import 'package:flutter/material.dart';
import 'package:pruebafl/home.dart';

void main() {
  runApp(MaterialApp(
    home: QR(),
  ));
}

class QR extends StatelessWidget {
  const QR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Contenedor morado como fondo superior
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF6772e5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              height: MediaQuery.of(context).size.height / 2,
              child: const Center(),
            ),
          ),
          // Contenedor blanco como fondo inferior
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(
              color: Color.fromARGB(245, 245, 245, 255),
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
          // Contenido central
          Positioned(
            top: 100,
            left: 30,
            right: 30,
            height: 650,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Text(
                      'Acceso',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Contenedor con imagen en el medio
                    const SizedBox(height: 30.0),
                    Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/qrex.png'), // Reemplaza con la ruta de tu imagen
                        ),
                      ),
                    ),
                    // Agrega cualquier otro contenido que desees aquí
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF6772e5)),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: Color(0xFF6772e5)),
            label: 'Acceso',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center, color: Color(0xFF6772e5)),
            label: 'Ejercicios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, color: Color(0xFF6772e5)),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color(0xFF6772e5)),
            label: 'Configuración',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Color(0xFF6772e5),
        onTap: (int index) {
          // Añadir lógica para cambiar de pantalla según la opción seleccionada
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QR()),
            );
          }
        },
      ),
    );
  }
}
