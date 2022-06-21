import 'package:advanced/app/extensions.dart';
import 'package:advanced/data/response/response.dart';
import 'package:advanced/domain/models/models.dart';

import '../../app/constants.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? "",
        this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? "", this?.link.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticaionResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contact.toDomain());
  }
}
