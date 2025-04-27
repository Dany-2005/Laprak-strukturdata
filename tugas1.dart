import 'dart:io';

class CircularQueue {
  List<int?> queue;
  int front, rear, size, capacity;

  CircularQueue(this.capacity)
      : queue = List.filled(capacity, null),
        front = -1,
        rear = -1,
        size = 0;

  bool isFull() => size == capacity;
  bool isEmpty() => size == 0;

  void enqueue(int item) {
    if (isFull()) {
      print('Queue penuh. Tidak bisa enqueue.');
      return;
    }
    if (front == -1) front = 0;

    rear = (rear + 1) % capacity;
    queue[rear] = item;
    size++;
    print('Enqueue: $item');
  }

  int? dequeue() {
    if (isEmpty()) {
      print('Queue kosong. Tidak bisa dequeue.');
      return null;
    }

    int? item = queue[front];
    queue[front] = null;
    front = (front + 1) % capacity;
    size--;

    // Jika sudah kosong, reset front dan rear
    if (isEmpty()) {
      front = -1;
      rear = -1;
    }

    print('Dequeue: $item');
    return item;
  }

  void display() {
    if (isEmpty()) {
      print('Queue kosong.');
      return;
    }
    print('Isi Queue: ');
    int i = front;
    for (int count = 0; count < size; count++) {
      stdout.write('${queue[i]} ');
      i = (i + 1) % capacity;
    }
    print('');
  }
}

void main() {
  var queue = CircularQueue(5); // kapasitas queue = 5

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.enqueue(50);
  queue.display();

  queue.dequeue();
  queue.dequeue();
  queue.display();

  queue.enqueue(60);
  queue.enqueue(70);
  queue.display();
}
