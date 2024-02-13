import 'package:academia/avaliacaopage.dart';
import 'package:academia/perfilpage.dart';
import 'package:academia/treinopage.dart';
import 'package:academia/PlanosPage.dart'; // Importe a nova página de planos
import 'package:flutter/material.dart';

class EditarPerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botões para navegar entre as páginas
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PerfilPage(),
                    ),
                  );
                },
                child: Text('Ver Perfil'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TreinoPage()),
                  );
                },
                child: Text('Ver Treino'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvaliacoesPage()),
                  );
                },
                child: Text('Ver Avaliações'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanosPage()),
                  );
                },
                child: Text('Ver Planos'),
              ),
              // Adicione mais botões conforme necessário
            ],
          ),
        ),
      ),
    );
  }
}
