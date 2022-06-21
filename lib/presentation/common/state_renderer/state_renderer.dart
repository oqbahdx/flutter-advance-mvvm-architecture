import 'package:advanced/presentation/resources/assets_manager.dart';
import 'package:advanced/presentation/resources/color_manager.dart';
import 'package:advanced/presentation/resources/strings_manager.dart';
import 'package:advanced/presentation/resources/styles_manager.dart';
import 'package:advanced/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType {
  // popup state
  popupLoadingState,
  popupErrorState,
  // full screen state
  fullScreenLoadingState,
  fullScreenErrorState,
  // content
  contentState
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function actionFunction;

  const StateRenderer(
      {Key? key,
      required this.stateRendererType,
      this.message = AppStrings.loading,
      this.title = "",
      required this.actionFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  _contentWidget(context);
  }

  Widget _contentWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
       return _getPopupDialog([
         _getAnimatedImage(JsonAssets.loading)
       ]);
      case StateRendererType.popupErrorState:
       return _getPopupDialog([
         _getAnimatedImage(JsonAssets.error),
         _getMessage(message),
         _retryButton(AppStrings.ok, context)
       ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.loading),
          _getMessage(message),
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _retryButton(AppStrings.retryAgain,context)
        ]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }
 Widget _getPopupDialog(List<Widget> children){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: ColorManager.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: ColorManager.black26
            ),
          ]
        ),
        child: _getDialogContent(children),
      ),
    );
 }

 Widget _getDialogContent(List<Widget> children){
      return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
 }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),//todo add image json here
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(color: ColorManager.black),
        ),
      ),
    );
  }

  Widget _retryButton(String buttonTitle,BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p18),
            child: ElevatedButton(onPressed: () {
              if(stateRendererType == StateRendererType.fullScreenErrorState){
                actionFunction.call();
              }else{
                Navigator.of(context).pop();
              }
            }, child: Text(buttonTitle)),
          ),
        ));
  }
}
