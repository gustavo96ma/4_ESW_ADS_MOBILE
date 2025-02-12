void main() {
  String texto = 'doideira total';
  int quantidade = 10;
  double divisao = 1 / 3;
  bool booleano = true;
  List<String> lista = ['a', 'b', 'c', 'd', 'e', 'f'];
  Map<String, int> map = {'chave': 2, 'chave2': 4};

  print(lista.runtimeType);

  List<String> ingredientes = [
    'massa',
    'molho de tomate',
    'queijo',
    'cebola',
    'orégano',
    'calabresa',
  ];

  // shift + alt + f -> formata o código

  Pizza pizzaCalabresa = Pizza(true, 'Calabresa', ingredientes);
  pizzaCalabresa.setSabor = 'Frango';

  print(pizzaCalabresa.isPizzaPronta());
  pizzaCalabresa.assarPizza();
  print(pizzaCalabresa.isPizzaPronta());




}

class Pizza {
  bool isFarinhaIntegral;
  String _sabor;
  List<String> ingredientes;
  bool _isPizzaCru;

  String get getSabor => _sabor;
  set setSabor(String sabor) => _sabor = sabor;

  void assarPizza() => _isPizzaCru = false;

  bool isPizzaPronta() => !_isPizzaCru;

  Pizza(this.isFarinhaIntegral, this._sabor, this.ingredientes,
      [this._isPizzaCru = true]);
}
