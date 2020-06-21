
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplenewproviderpattern/providers/future_provider_model.dart';
import 'package:samplenewproviderpattern/providers/provider_model.dart';
import 'package:samplenewproviderpattern/providers/stream_provider_model.dart';

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

  FutureProviderModel _futureProviderModel;
  FutureProviderModel get futureProviderModel => _futureProviderModel;

  set futureProviderModel(FutureProviderModel futureProviderModel) {
    if(_futureProviderModel != futureProviderModel) {
      _futureProviderModel = futureProviderModel;
      notifyListeners();
    }
  }

  StreamProviderModel _streamProviderModel;
  StreamProviderModel get streamProviderModel => _streamProviderModel;
  int get myStreamValue => streamProviderModel.counter * 10;

  set streamProviderModel(StreamProviderModel streamProviderModel) {
    if(_streamProviderModel != streamProviderModel) {
      _streamProviderModel = streamProviderModel;
      notifyListeners();
    }
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}