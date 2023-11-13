import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pruebafl/QR.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  List<charts.Series<ProgressData, num>> _createSampleData() {
    final data = [
      ProgressData(1, 5),
      ProgressData(2, 7),
      ProgressData(3, 3),
    ];

    return [
      charts.Series<ProgressData, num>(
        id: 'Progress',
        domainFn: (ProgressData progress, _) => progress.category,
        measureFn: (ProgressData progress, _) => progress.value,
        data: data,
      ),
    ];
  }

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
            top: 50,
            left: 10,
            right: 10,
            height: 750,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 30.0, left: 15.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Hola, Gustavo',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Aquí está tu progreso esta semana',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 200,
                          child: AnimatedLineChart(_createSampleData(), animate: true),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Tu rutina diaria',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CardWithImageAndButton(
                          title: 'Calentamiento',
                          subtitle: '8 Minutos - Principiante ',
                          imagePath: 'assets/warmup.jpg',
                          onPressed: () {
                            // Lógica cuando se presiona el botón
                            print('Comenzar calentamiento');
                          },
                        ),
                        const SizedBox(height: 20),
                        CardWithImageAndButton(
                          title: 'Pierna',
                          subtitle: '15 Minutos - Principiante',
                          imagePath: 'assets/legs.jpg',
                          onPressed: () {
                            // Lógica cuando se presiona el botón
                            print('Comenzar ejercicios de pierna');
                          },
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 665,
                      right: 20,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/users.png'),
                          ),
                        ),
                      ),
                    ),
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
            label: 'QR',
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
        currentIndex: 0,
        selectedItemColor: Color(0xFF6772e5),
        onTap: (int index) {
          // Añadir lógica para cambiar de pantalla según la opción seleccionada
          if (index == 1) {
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

class AnimatedLineChart extends StatelessWidget {
  final List<charts.Series<ProgressData, num>> seriesList;
  final bool animate;

  AnimatedLineChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
    );
  }
}

class ProgressData {
  final num category;
  final int value;

  ProgressData(this.category, this.value);
}

class CardWithImageAndButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onPressed;

  const CardWithImageAndButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      elevation: 8,
      child: Container(
        height: 140.0,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton.icon(
                    onPressed: onPressed,
                    icon: Icon(Icons.arrow_forward),
                    label: Text('Comenzar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
