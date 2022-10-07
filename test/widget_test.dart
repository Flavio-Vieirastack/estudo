import 'package:flutter_test/flutter_test.dart';

class ClasseSoma {
  int soma({required int primeiroNumero, required int segundoNumero}) {
    return primeiroNumero + segundoNumero;
  }

  void retornaVoid() {}
}

void main() {
  test('description1', () {
    //arrange
    final clase = ClasseSoma();
    //act
    final sut = clase.soma(primeiroNumero: 2, segundoNumero: 2);
    //expect
    expect(sut, 4);
  });
  test('description2', () {
    //arrange
    final clase = ClasseSoma();
    //act
    final sut = clase.retornaVoid;
    //expect
    expect(() => sut(), isA<void>());
  });
}
