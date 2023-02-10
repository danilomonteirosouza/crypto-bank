import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cryptocoin_event.dart';
part 'cryptocoin_state.dart';

class CryptocoinBloc extends Bloc<CryptocoinEvent, CryptocoinState> {
  CryptocoinBloc() : super(CryptocoinInitial()) {
    on<CryptocoinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
