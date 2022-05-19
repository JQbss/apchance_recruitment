import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {

  StreamSubscription? subscription;

  ConnectionBloc() : super(ConnectionLoading()) {
    on<OnConnectedEvent>((event, emit) => emit(ConnectionSuccess()));
    on<OnNotConnectedEvent>((event, emit) => emit(ConnectionFailure()));

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if(result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
        add(OnConnectedEvent());
      }else{
        add(OnNotConnectedEvent());
      }
    });
  }
}
