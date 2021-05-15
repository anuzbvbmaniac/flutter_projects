import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String code;
  final String message;

  const Failure({
    this.code = '',
    this.message = '',
  });

  @override
  bool get stringify => true;

  ///  * Helps compare two objects
  ///  * otherwise in this scenario, to compare the objects (failure1 & failure2),
  ///  * we had to failure1.code == failure2.code && failure1.messages == failure2.messages
  ///  * and as our code increases the comparison blocks gets verbose
  ///  * so to make this easy we are using Equatable Plugin.
  @override
  List<Object> get props => [code, message];
}
