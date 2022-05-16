import 'package:advanced/app/constants.dart';
import 'package:advanced/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced/presentation/resources/string_manager.dart';
import 'package:flutter/cupertino.dart';

abstract class FlowState {
  StateRendererType getStateRendererTyp();

  String getMessage();
}

// loading popup , full screen
class LoadingSate extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingSate(
      {required this.stateRendererType, this.message = AppString.login});

  @override
  String getMessage() => message ?? AppString.login;

  @override
  StateRendererType getStateRendererTyp() => stateRendererType;
}

// error popup , full screen

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState({required this.stateRendererType, this.message = AppString.login});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererTyp() => stateRendererType;
}

// content state
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererTyp() => StateRendererType.contentState;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererTyp() => StateRendererType.fullScreenEmpty;
}
