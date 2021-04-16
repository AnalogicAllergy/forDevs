import 'package:flutter_test/flutter_test.dart';
import 'package:fordev/presentation/protocols/protocols.dart';
import 'package:fordev/validation/protocols/protocols.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite({this.validations});
  @override
  String validate({@required String field, @required String value}) {
    return null;
  }
}

class FieldValidationSpy extends Mock implements FieldValidation {}

void main() {
  ValidationComposite sut;
  FieldValidationSpy validation1;
  FieldValidationSpy validation2;
  FieldValidationSpy validation3;
  void mockValidation1(String error) {
    when(validation1.validate(any)).thenReturn(error);
  }

  void mockValidation2(String error) {
    when(validation2.validate(any)).thenReturn(error);
  }

  void mockValidation3(String error) {
    when(validation1.validate(any)).thenReturn(error);
  }

  setUp(() {
    sut = ValidationComposite(validations: []);
    validation1 = FieldValidationSpy();
    when((validation1.field)).thenReturn('any_field');
    mockValidation1(null);
    validation2 = FieldValidationSpy();
    when((validation2.field)).thenReturn('any_field');
    mockValidation2(null);
    validation3 = FieldValidationSpy();
    when((validation2.field)).thenReturn('other_field');
    mockValidation3(null);
  });
  test('should return null if all validations return null or empty', () {
    sut.validations.add(validation1);
    sut.validations.add(validation2);
    mockValidation2('');
    final error = sut.validate(field: 'any_field', value: 'any_value');
    expect(error, null);
  });
}
