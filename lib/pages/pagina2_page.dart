import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/usuario.dart';
import 'package:flutter_singleton/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<Usuario>(
          stream: usuarioSevice.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${snapshot.data!.nombre!}')
                : const Text('Pagina 2');

          }
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
                onPressed: (){
                  final nuevoUsuario = Usuario(
                      nombre: 'Carlos',
                      edad: 25,
                      profesiones: []
                  );
                  usuarioSevice.cargarUsuario(nuevoUsuario);
                },
                color: Colors.blue,
                child: const Text('Establecer Usuario',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ),

            MaterialButton(
              onPressed: (){
                usuarioSevice.cambiarEdad(20);
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),

            MaterialButton(
              onPressed: (){},
              color: Colors.blue,
              child: const Text('Añadir Profesion',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            

          ],
        )
      ),
    );
  }
}
