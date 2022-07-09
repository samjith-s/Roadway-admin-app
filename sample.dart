// import 'package:flutter_test/flutter_test.dart';

void main() async {
  var data1 = data();
  data1.listen(
    (event) => print(event),
  );
  //data().forEach((element) {print(element);});
}

Stream<int> data() async* {
  for (int i = 0; i < 10; i++) {
    Future.delayed(
      Duration(seconds: 1),
    );
    yield i;
  }
}
