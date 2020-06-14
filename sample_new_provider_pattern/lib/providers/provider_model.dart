

import 'dart:io';

class ProviderModel {

  int counter = 0;
  String baseUrl = Platform.isAndroid ? 'http://10.0.0.2:3000' : 'http://localhost:3000';

  void incrementCounter() {
    counter++;
    print('Counter value in provider model $counter');
  }
}