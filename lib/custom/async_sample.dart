Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}

void main() async {
  Stream<int> myCountStream = countStream(10);
  myCountStream.listen((event) {
    print('Received: $event');
  });
}
