import 'package:dartz/dartz.dart';

import 'package:vigor/domain/core/failures.dart';
import 'package:vigor/domain/core/value_objects.dart';
import 'package:vigor/domain/core/value_validators.dart';

class RegistrationName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RegistrationName(String input) {
    assert(input != null);
    return RegistrationName._(
      validateRegistrationName(input),
    );
  }

  const RegistrationName._(this.value);
}
