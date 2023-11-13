import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:pruebafl/login.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({Key? key}) : super(key: key);


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
              decoration: BoxDecoration(
                color: const Color(0xFF6772e5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0), // Ajusta el radio de las esquinas
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              height: MediaQuery.of(context).size.height / 2,
              child: Center(

              ),
            ),
          ),
          // Contenedor blanco como fondo inferior
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(

              color: Color.fromARGB(245,245,245,255),
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
                margin: EdgeInsets.only(top: 30.0),
                child: Column(

                  children: [
                    Text(

                      'Nueva Cuenta', // Texto arriba del TextField
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20), // Espacio entre el texto y el TextField
                    TextFieldData(
                      labelText: 'Nombre',
                      prefixIcon: Icon(Icons.person),
                    ),
                    SizedBox(height: 20),
                    TextFieldData(
                      labelText: 'Apellido',
                      prefixIcon: Icon(Icons.person),
                    ),
                    SizedBox(height: 20),
                    TextFieldData(
                      labelText: 'Teléfono',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    SizedBox(height: 20),
                    TextFieldData(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 20),
                    TextFieldPassword(
                      labelText: 'Contraseña',
                    ),
                    SizedBox(height: 20),
                    TextFieldPassword(
                      labelText: 'Confirmar contraseña',
                    ),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 50),
                        primary: const Color(0xFF6772e5), // Cambia el color de fondo del botón
                        onPrimary: Colors.white,
                      ),
                      child: Text('CREAR CUENTA',
                        style: TextStyle(
                          fontSize: 18, // Tamaño de fuente más grande
                          fontWeight: FontWeight.bold, // Texto en negritas,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente en el Row
                        children: [
                          Text(
                            '¿Ya tienes cuenta?', // Texto antes del botón
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const Login(),
                                ),
                              );
                            },
                            child: Text("LOGIN"),
                          ),
                        ],
                      ),
                    )
                      // Agrega cualquier otro contenido que desees aquí
                  ],

                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final String labelText;

  const TextFieldPassword({
    Key? key,
    required this.labelText,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(16),
          labelText: labelText,
          filled: true, // Set to true to fill the background
          fillColor:  Color.fromARGB(245,245,245,255),

        ),
      ),
    );
  }
}

class TextFieldData extends StatelessWidget {
  final String labelText;
  final Icon prefixIcon;

  const TextFieldData({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(16),
          labelText: labelText,
          filled: true,
          fillColor: Color.fromARGB(245, 245, 245, 255),
        ),
      ),
    );
  }
}


