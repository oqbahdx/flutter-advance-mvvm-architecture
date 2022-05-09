import 'package:advanced/app/constants.dart';

import '../response/responses.dart';
import 'package:advanced/app/extensions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  CustomerResponse toDomain() {
    return CustomerResponse(
        this?.id.orEmpty() ?? Constants.empty,
        this?.mame.orEmpty() ?? Constants.empty,
        this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  ContactsResponse toDomain() {
    return ContactsResponse(this?.email.orEmpty() ?? Constants.empty,
        this?.phone.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  AuthenticationResponse toDomain(){
    return AuthenticationResponse(this?.customer.toDomain(),this?.contacts.toDomain());
  }
}
