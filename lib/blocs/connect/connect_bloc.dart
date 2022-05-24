import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connect_event.dart';
part 'connect_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  StreamSubscription? subscription;

  ConnectBloc() : super(ConnectionLoading()) {
    on<OnConnectedEvent>((event, emit) => emit(ConnectionSuccess()));
    on<OnNotConnectedEvent>((event, emit) => emit(ConnectionFailure()));
    on<OnOfflineConnectedEvent>((event, emit) => emit(ConnectionOffline()));

    Connectivity().checkConnectivity().then((result) {
      if(result==ConnectivityResult.none){
        add(OnNotConnectedEvent());
      }
    });
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
