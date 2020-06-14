
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:samplenewproviderpattern/providers/provider_model.dart';

class ChangeNotifierModel with ChangeNotifier {

  int counter = 0;
  ProviderModel _providerModel;
  ProviderModel get providerModel => _providerModel;

  set providerModel(ProviderModel providerModel) {
    if(_providerModel != providerModel) {
      _providerModel = providerModel;
      notifyListeners();
    }
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}