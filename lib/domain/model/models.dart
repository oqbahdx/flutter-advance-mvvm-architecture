// onBoarding model

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
// login model
class Customers {
  String id;
  String name;
  int numOfNotifications;

  Customers(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;

  Contacts(this.phone, this.email);
}

class Authentication {
  Customers? customers;
  Contacts? contacts;

  Authentication(this.customers, this.contacts);
}
