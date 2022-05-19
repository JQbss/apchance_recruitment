part of 'connection_bloc.dart';

@immutable
abstract class ConnectionState {}

class ConnectionLoading extends ConnectionState {}

class ConnectionSuccess extends ConnectionState {}

class ConnectionFailure extends ConnectionState {}
