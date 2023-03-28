import 'package:flutter/material.dart';
import 'package:flutter_singleton/models/usuario.dart';
import 'package:flutter_singleton/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: StreamBuilder<Usuario>(
        stream: usuarioSevice.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){

          return snapshot.hasData
              ?  InformacionUsuario(snapshot.data!)
              : const Center(child: Text('No hay informacion del usuario'));

        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text('General',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          const Divider(),

          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),

          const Text('Profesiones',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          const Divider(),

          const ListTile(
            title: Text('Profesiones 1 '),
          ),
          const ListTile(
            title: Text('Profesiones 2 '),
          ),
          const ListTile(
            title: Text('Profesiones 3 '),
          ),



        ],
      ),
    );
  }
}
