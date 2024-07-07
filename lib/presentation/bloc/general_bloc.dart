import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(GeneralState.init()) {
    on<GeneralEvent>(_onGeneralEvent);
  }

  FutureOr<void> _onGeneralEvent(
    GeneralEvent event,
    Emitter<GeneralState> emit,
  ) {
    emit(state.addPickedValue(event.value));
  }
}
