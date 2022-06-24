import 'package:advanced/app/constants.dart';
import 'package:advanced/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState(
      {required this.stateRendererType, String message = AppStrings.loading});

  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.message, this.stateRendererType);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

extension FlowStateExtension on FlowState{
  Widget getContent(BuildContext context ,Widget contentScreenWidget,Function retryAction){
    switch(runtimeType){
      case LoadingState:{
        if(getStateRendererType() == StateRendererType.popupLoadingState){
          // show popup screen
          showPopup(context,
              getStateRendererType(), getMessage());
          // show content
          return contentScreenWidget;
        }else{
          // show full screen
          return StateRenderer(stateRendererType: getStateRendererType(),
              actionFunction: retryAction,message: getMessage(),);
        }
      }
      case ContentState:{
        return contentScreenWidget;
      }
      case EmptyState:{
        return StateRenderer(stateRendererType: getStateRendererType(),
            actionFunction: (){},message: getMessage(),);
      }
      case ErrorState:{
        if(getStateRendererType() == StateRendererType.popupErrorState){
          showPopup(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        }else{
          return StateRenderer(stateRendererType: getStateRendererType(),
              actionFunction: retryAction,message: getMessage(),);
        }
      }
      default:{
       return contentScreenWidget;
      }
    }
  }
  showPopup(BuildContext context , StateRendererType stateRendererType,String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(context: context,
        builder: (BuildContext context)=>StateRenderer(stateRendererType: stateRendererType,
           message: message,
            actionFunction: (){

            })));
  }
}