import 'package:flutter/material.dart';

Widget buildCampoEdicao(String rotulo, String valorAtual) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(rotulo, style: TextStyle(fontSize: 16)),
      TextFormField(
        initialValue: valorAtual,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        // Adicione controladores e validações conforme necessário
      ),
      SizedBox(height: 10),
    ],
  );
}

class AvaliacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliações'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCampoEdicao("Avaliação#001 27/11:",
                "Boa resistência, ótimo ganho muscular, bom físico. Professora: Fernanda"),
            // Adicione campos de avaliações conforme necessário
          ],
        ),
      ),
    );
  }
}
