import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:shop_mania/core/dio/exceptions.dart';
import 'package:shop_mania/core/theme.dart';

class CustomToast {
  CustomToast.showDefault(String message) {
    BotToast.closeAllLoading();
    showToast(message);
  }

  CustomToast.showError(CustomError error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BotToast.closeAllLoading();
    });

    String message = "";
    switch (error) {
      case CustomError.noInternet:
        message = "Please check your Internet connection";
        break;
      case CustomError.conflict:
        message = "User Not Found";
        break;
      case CustomError.unKnown:
        message = "Something Went Wrong";
        break;
      case CustomError.formatException:
        message = "Something Went Wrong";
        break;
      case CustomError.askForCode:
        message = "askForCode";
        break;
      case CustomError.alreadyExists:
        message = "Already Exists";
        break;
      case CustomError.notFound:
        message = "User is not Found";
        break;
      case CustomError.badRequest:
        message = "Something Went Wrong";
        break;
      case CustomError.wrongCode:
        message = "Wrong Code";
        break;
      case CustomError.wrongPassword:
        message = " Your password is wrong ";
        break;
      case CustomError.phoneAlreadyExists:
        message = "Account For Client";
        break;
      case CustomError.mustNumber:
        message = "Number field must be number";
        break;
      case CustomError.emailNotValid:
        message = "Email field must be valid";
        break;
    }

    showToast(message);
  }

  CustomToast.showLoading() {
    showLoading();
  }

  void showToast(String message) {
    BotToast.showText(
      text: message,
      textStyle: const TextStyle(
        overflow: TextOverflow.visible,
        color: ConstColors.white,
      ),
      contentColor: ConstColors.primary,
      crossPage: false,
      clickClose: true,
      duration: const Duration(seconds: 5),
    );
  }

  void showLoading() {
    BotToast.showLoading();
  }

  CustomToast.closeLoading() {
    closeLoading();
  }

  void closeLoading() {
    BotToast.closeAllLoading();
  }
}
