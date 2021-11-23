void main(List<String> args) {
  Stream<int> stream = boatNumbers();
  stream.listen((receivedData)=>
  print('Boat number $receivedData is received'));
}

Stream<int> boatNumbers() async* {
  for (var i = 0; i < 10; i++) {
    print('Boat number $i is sent');
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
