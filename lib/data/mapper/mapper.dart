import 'package:advanced/app/constants.dart';

import '../../domain/model/models.dart';
import '../response/responses.dart';
import 'package:advanced/app/extensions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customers toDomain() {
    return Customers(
        this?.id.orEmpty() ?? Constants.empty,
        this?.mame.orEmpty() ?? Constants.empty,
        this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.email.orEmpty() ?? Constants.empty,
        this?.phone.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(this?.customer.toDomain(),this?.contacts.toDomain());
  }
}
