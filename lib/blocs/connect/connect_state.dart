part of 'connect_bloc.dart';

@immutable
abstract class ConnectState {}

class ConnectionLoading extends ConnectState {}

class ConnectionSuccess extends ConnectState {}

class ConnectionOffline extends ConnectState {}

class ConnectionFailure extends ConnectState {}