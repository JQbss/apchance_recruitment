part of 'connect_bloc.dart';

@immutable
abstract class ConnectEvent {}

class OnConnectedEvent extends ConnectEvent {}

class OnOfflineConnectedEvent extends ConnectEvent {}

class OnNotConnectedEvent extends ConnectEvent {}