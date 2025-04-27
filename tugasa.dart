import 'dart:io';

// Stack class
class Stack<T> {
  List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    return _items.removeLast();
  }

  bool isEmpty() {
    return _items.isEmpty;
  }
}

// Konversi Bilangan
class KonversiBilangan {
  int angka;

  KonversiBilangan(this.angka);

  String desimalKeBiner() {
    return angka.toRadixString(2);
  }

  String desimalKeOktal() {
    return angka.toRadixString(8);
  }

  String desimalKeHeksadesimal() {
    return angka.toRadixString(16);
  }
}

void main() {
  stdout.write('Masukkan nilai desimal: ');
  int angka = int.parse(stdin.readLineSync()!);

  var konversi = KonversiBilangan(angka);
  print('Hasil nilai biner = ${konversi.desimalKeBiner()}');
  print('Hasil nilai oktal = ${konversi.desimalKeOktal()}');
  print('Hasil nilai heksadesimal = ${konversi.desimalKeHeksadesimal()}');
}
