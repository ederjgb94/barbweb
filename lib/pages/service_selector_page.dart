import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceSelectorPage extends StatelessWidget {
  ServiceSelectorPage({super.key});

  List<Map<String, dynamic>> services = [
    {
      'servicio': 'Corte de cabello',
      'precio': 70,
    },
    {
      'servicio': 'Manicure',
      'precio': 50,
    },
    {
      'servicio': 'Pedicure',
      'precio': 60,
    },
    {
      'servicio': 'Depilación',
      'precio': 100,
    },
    {
      'servicio': 'Maquillaje',
      'precio': 80,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Servicios'),
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        toolbarHeight: 200,
        flexibleSpace: Image.network(
          'https://as2.ftcdn.net/v2/jpg/03/22/39/11/1000_F_322391161_op0f5p9bQooDAIDxH1nfLkFTLglXExls.jpg',
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 50, 50, 50),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 100, 100, 100),
                  width: 2,
                ),
              ),
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Seleccionar Servicio',
                    style: GoogleFonts.prata(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var service in services)
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          if (kDebugMode) {
                            print('Service selected: ${service['servicio']}');
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  service['servicio'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  '\$${service['precio']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
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
            ),
          ],
        ),
      ),
    );
  }
}
