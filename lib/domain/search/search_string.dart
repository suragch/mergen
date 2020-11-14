// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

// /// A wrapper for search strings.
// ///
// /// If a SearchString instance exists, then it has alread been verified.
// /// If the string passed into the constructor is invalid, then it will
// /// throw an [InvalidSearchStringException].
// @immutable
// class SearchString extends Equatable {
//   final String value;

//   SearchString._(this.value);

//   factory SearchString(String searchString) {
//     validateSearchString(searchString);
//     return SearchString._(searchString);
//   }

//   @override
//   List<Object> get props => [value];
// }

// class InvalidSearchStringException implements Exception {
//   final String cause = '';
// }

// void validateSearchString(String searchString) {
//   if (searchString == null) {
//     throw InvalidSearchStringException();
//   }
//   if (searchString.length > 0 && searchString.trim().isEmpty) {
//     throw InvalidSearchStringException();
//   }
//   return;
// }

// // class PasswordTooShortException implements InvalidPasswordException {
// //   @override
// //   String get cause => 'Password must be at least ${Password.minLength} characters long.';
// // }

// // class PasswordContainsOnlyNumbersException implements InvalidPasswordException {
// //   @override
// //   String get cause => throw UnimplementedError();
// // }

// // bool _isTooShort(String password) {
// //   if (password.length < Password.minLength) return true;
// //   return false;
// // }

// // bool _containsOnlyNumbers(String password) {
// //   final regex = RegExp(r"[^0-9]");
// //   return !regex.hasMatch(password);
// // }
