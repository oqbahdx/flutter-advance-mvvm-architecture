abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  // share variables and functions that will be used through any view model
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void dispose(); // will be call when view model dies
}

abstract class BaseViewModelOutputs {}
