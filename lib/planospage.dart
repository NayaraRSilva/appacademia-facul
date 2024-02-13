import 'package:flutter/material.dart';

class PlanosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: ListView(
          children: [
            _buildPlanoButton(
              context,
              'Plano Básico',
              'Acesso básico à academia',
              'R\$50,00/mês',
            ),
            SizedBox(height: 30),
            _buildPlanoButton(
              context,
              'Plano Intermediário',
              'Acesso intermediário à academia + Treinos personalizados',
              'R\$80,00/mês',
            ),
            SizedBox(height: 16),
            _buildPlanoButton(
              context,
              'Plano Premium',
              'Acesso premium à academia + Treinos personalizados + Avaliações mensais',
              'R\$120,00/mês',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanoButton(
      BuildContext context, String nome, String descricao, String preco) {
    return ElevatedButton(
      onPressed: () {
        // Adicione aqui a lógica para processar a escolha do plano
        _mostrarDialogoEscolhaPlano(context, nome);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(descricao),
              SizedBox(height: 8),
              Text(
                'Preço: $preco',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoEscolhaPlano(BuildContext context, String nomePlano) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escolha do Plano'),
          content: Text('Você escolheu o plano: $nomePlano'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
