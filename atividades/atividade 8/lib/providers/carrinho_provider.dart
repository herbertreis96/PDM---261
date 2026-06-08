import 'package:flutter/material.dart';
import '../models/produto.dart';

class CarrinhoProvider extends ChangeNotifier {

  final List<Produto> _itens = [];

  List<Produto> get itens => _itens;

  void adicionarProduto(Produto produto) {
    _itens.add(produto);
    notifyListeners();
  }

  void removerProduto(Produto produto) {
    _itens.remove(produto);
    notifyListeners();
  }

  double get total {
    double soma = 0;

    for (var item in _itens) {
      soma += item.preco;
    }

    return soma;
  }
}
