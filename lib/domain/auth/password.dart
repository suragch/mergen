import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A wrapper for password strings.
///
/// If a Password instance exists, then it has alread been verified.
/// If the string passed into the constructor is invalid, then it will
/// throw an [InvalidPasswordException], which could be 
/// [PasswordTooShortException] (if the length is less than
/// [Password.minLength]) or [PasswordContainsOnlyNumbersException] (if the
/// password doesn't have any characters except for numbers).
@immutable
class Password extends Equatable {
  final String value;
  static const int minLength = 16;

  Password._(this.value);

  factory Password(String password) {
    
    if (password == null) {
      throw InvalidPasswordException();
    } 
    
    if (_isTooShort(password)) {
      throw PasswordTooShortException();
    }

    if (_containsOnlyNumbers(password)) {
      throw PasswordContainsOnlyNumbersException();
    }

    return Password._(password);
  }

  @override
  List<Object> get props => [value];
}

class InvalidPasswordException implements Exception {
  final String cause = '';
}
class PasswordTooShortException implements InvalidPasswordException {
  @override
  String get cause => 'Password must be at least ${Password.minLength} characters long.';
}

class PasswordContainsOnlyNumbersException implements InvalidPasswordException {
  @override
  String get cause => throw UnimplementedError();
}

bool _isTooShort(String password) {
  if (password.length < Password.minLength) return true;
  return false;
}

bool _containsOnlyNumbers(String password) {
  final regex = RegExp(r"[^0-9]");
  return !regex.hasMatch(password);
}
