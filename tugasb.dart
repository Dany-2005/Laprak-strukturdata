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

// Palindrom dan Membalik Kalimat
class PalindromChecker {
  String kalimat;

  PalindromChecker(this.kalimat);

  String balikKalimat() {
    Stack<String> stack = Stack<String>();
    for (var huruf in kalimat.split('')) {
      stack.push(huruf);
    }

    String hasil = '';
    while (!stack.isEmpty()) {
      hasil += stack.pop();
    }
    return hasil;
  }

  bool cekPalindrom() {
    String tanpaSpasi = kalimat.replaceAll(' ', '').toLowerCase();
    String terbalik = balikKalimat().replaceAll(' ', '').toLowerCase();
    return tanpaSpasi == terbalik;
  }
}

void main() {
  stdout.write('Masukkan kalimat: ');
  String kalimat = stdin.readLineSync()!;

  var checker = PalindromChecker(kalimat);
  String hasilBalik = checker.balikKalimat();
  bool palindrom = checker.cekPalindrom();

  print('Hasil = $hasilBalik');
  print(palindrom ? 'Palindrom' : 'Bukan palindrom');
}
