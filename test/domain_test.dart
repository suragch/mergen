import 'package:mergen/domain/auth/email_address.dart';
import 'package:mergen/domain/auth/password.dart';
import 'package:mergen/domain/search/search_string.dart';
import 'package:test/test.dart';

void main() {
  test('Only valid email address are allowed in EmailAddress class', () {
    final valid1 = EmailAddress('a@example.com');
    expect(valid1.emailAddress, equals('a@example.com'));
    expect(() => EmailAddress('123'),
        throwsA(TypeMatcher<InvalidEmailAddressException>()));
  });

  test('Only valid passwords are allowed in Password class', () {
    final valid1 = Password('password12345678');
    expect(valid1.value, equals('password12345678'));
    expect(
        () => Password(null), throwsA(TypeMatcher<InvalidPasswordException>()));
    expect(() => Password('password'),
        throwsA(TypeMatcher<PasswordTooShortException>()));
    expect(() => Password('1234567890123456'),
        throwsA(TypeMatcher<PasswordContainsOnlyNumbersException>()));
  });

  test('Only valid strings are allowed in SearchString class', () {
    expect(SearchString('abc').value, equals('abc'));
    expect(SearchString('').value, equals(''));
    expect(() => SearchString(null),
        throwsA(TypeMatcher<InvalidSearchStringException>()));
    expect(() => SearchString(' '),
        throwsA(TypeMatcher<InvalidSearchStringException>()));
  });
}
