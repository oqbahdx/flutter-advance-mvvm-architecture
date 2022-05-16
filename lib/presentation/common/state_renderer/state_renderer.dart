import 'package:advanced/presentation/resources/assets_manager.dart';
import 'package:advanced/presentation/resources/color_manager.dart';
import 'package:advanced/presentation/resources/font_manager.dart';
import 'package:advanced/presentation/resources/string_manager.dart';
import 'package:advanced/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../resources/values_manager.dart';

enum StateRendererType {
  // popup state renderer
  popupLoadingState,
  popupErrorState,
  // full screen renderer
  fullScreenLoadingSate,
  fullScreenErrorState,
  fullScreenEmpty,
  // general
  contentState
}

class StateRenderer extends StatelessWidget {
  const StateRenderer(
      {Key? key,
      required this.stateRendererType,
      this.message = "",
      this.title = "",
      required this.retryActionFunction})
      : super(key: key);
  final StateRendererType stateRendererType;
  final String title;
  final String message;
  final Function retryActionFunction;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopupDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.popupErrorState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessageTitle(message),
          _getRetryButton(AppString.ok, context),
        ]);
      case StateRendererType.fullScreenLoadingSate:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.loading),
          _getMessageTitle(message),
        ]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessageTitle(message),
          _getRetryButton(AppString.tryAgain, context)
        ]);
      case StateRendererType.fullScreenEmpty:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.empty),
          _getMessageTitle(message),
        ]);
      case StateRendererType.contentState:
        return Container();
    }
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
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessageTitle(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          title,
          style: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonMessage, BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererType ==
                    StateRendererType.fullScreenErrorState) {
                  retryActionFunction.call();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(buttonMessage))),
    ));
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: ColorManager.transparent,
      child: Container(
        decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
          BoxShadow(color: ColorManager.black26),
        ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
    ;
  }
}
