import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'events/settings_event.dart';
part 'states/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  @override
  SettingsState get initialState => SettingsState(temperatureUnits: TemperatureUnits.celsius);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event,) async* {
    if (event is TemperatureUnitsToggled) {
      yield toggleTemperatureUnits(state);
    }
  }

  SettingsState toggleTemperatureUnits(SettingsState state) {
    return SettingsState(
      temperatureUnits: state.temperatureUnits == TemperatureUnits.celsius
          ? TemperatureUnits.fahrenheit : TemperatureUnits.celsius
    );
  }
}
