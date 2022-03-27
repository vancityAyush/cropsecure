import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = RequiredValidator(errorText: '*required');
final phoneValidator = MultiValidator([
  RequiredValidator(errorText: '*required'),
  MinLengthValidator(12, errorText: 'Enter a valid Mobile number'),
  MaxLengthValidator(12, errorText: 'Enter a valid Mobile number'),
]);
final pinValidator = MultiValidator([
  RequiredValidator(errorText: '*required'),
  MinLengthValidator(8, errorText: 'Enter a valid pincode'),
  MaxLengthValidator(8, errorText: 'Enter a valid pincode')
]);
