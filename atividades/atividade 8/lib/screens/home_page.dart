import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';
import '../providers/carrinho_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Produto> produtos = [
    Produto(nome: 'Notebook', preco: 3500),
    Produto(nome: 'Mouse', preco: 80),
    Produto(nome: 'Teclado', preco: 150),
    Produto(nome: 'Monitor', preco: 900),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Flutter'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {

                final produto = produtos[index];

                return ListTile(
                  title: Text(produto.nome),
                  subtitle: Text(
                    'R\$ ${produto.preco.toStringAsFixed(2)}',
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      context
                          .read<CarrinhoProvider>()
                          .adicionarProduto(produto);
                    },
                    child: const Text('Adicionar'),
                  ),
                );
              },
            ),
          ),

          Consumer<CarrinhoProvider>(
            builder: (context, carrinho, child) {
              return Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade200,
                child: Column(
                  children: [

                    Text(
                      'Itens no Carrinho: ${carrinho.itens.length}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Total: R\$ ${carrinho.total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
