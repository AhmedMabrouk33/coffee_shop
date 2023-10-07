import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodel/auth_viewmodel.dart';

import '../../utils/widgets/spacing/empty_spacing.dart';
import '../../utils/widgets/text_field/lable_text_field_widget.dart';
import '../../utils/widgets/custom_clipper/custom_clipper_widget.dart';
import '../../utils/widgets/text_field/label_password_text_field.dart';

class AuthForgetPasswordState extends StatelessWidget {
  const AuthForgetPasswordState({super.key});

  Path _forgetPasswordStateClipPath(Size size) {
    var currentPath = Path()..moveTo(size.width, 0);
    double heightRatio = (size.height / 260);
    double widthRatio = (size.width / 360);

    currentPath.lineTo(0, 0);
    currentPath.cubicTo(
      0,
      149.19 * heightRatio,
      42.86 * widthRatio,
      182.15 * heightRatio,
      110.11 * widthRatio,
      185.5 * heightRatio,
    );
    currentPath.lineTo(
      245.91 * widthRatio,
      185.5 * heightRatio,
    );
    currentPath.cubicTo(
      288.25 * widthRatio,
      185.5 * heightRatio,
      359.01 * widthRatio,
      205.34 * heightRatio,
      size.width,
      size.height,
    );

    currentPath.close();
    return currentPath;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _forgetPasswordHeaderWidget(context),
        const EmptySpacingWidget(heightRatio: 50 / 800).build(context),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...Get.find<AuthViewModel>().isShowResetPassword()
                    ? _resetPassword(context)
                    : _newPasswordWidgets(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _forgetPasswordClipperChildWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * (85 / 800),
      ),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 50,
            width: 100,
            child: Image.asset(
              'assets/images/logo.png',
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _forgetPasswordHeaderWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * (260 / 800),
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * (260 / 800),
            child: ClipPath(
              clipper:
                  MyCustomClipper(clipPathFunc: _forgetPasswordStateClipPath),
              child: _forgetPasswordClipperChildWidget(context),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * (45 / 800),
            left: 60,
            child: IconButton(
              onPressed: Get.find<AuthViewModel>().popCurrentState,
              icon: const Icon(Icons.arrow_left_outlined),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _resetPassword(BuildContext context) {
    return [
      Text(
        'Reset password ?',
        softWrap: true,
        textScaleFactor: MediaQuery.sizeOf(context).height > 360
            ? MediaQuery.sizeOf(context).height / 800
            : 0.35,
        style: Get.textTheme.displayLarge,
      ),
      const EmptySpacingWidget(heightRatio: 26 / 800).build(context),
      LabelTextFieldWidget(
        label: 'Email',
        controller: Get.find<AuthViewModel>().emailController,
        hint: 'Email',
        leftPadding: 17,
        rightPadding: 19,
        keyboardType: TextInputType.emailAddress,
        spacingBetween: 15,
        onEditingComplete: () => Get.focusScope!.nextFocus(),
        autoFocus: true,
      ),
      const EmptySpacingWidget(heightRatio: 50 / 800).build(context),
      ElevatedButton(
        onPressed: () {},
        style: Get.theme.elevatedButtonTheme.style?.copyWith(
          fixedSize: MaterialStatePropertyAll(
            Size(MediaQuery.sizeOf(context).width * (284 / 360), 51),
          ),
        ),
        child: const Text('Reset Password'),
      ),
    ];
  }

  List<Widget> _newPasswordWidgets(BuildContext context) {
    return [
      Text(
        'Enter New Password',
        softWrap: true,
        textScaleFactor: MediaQuery.sizeOf(context).height > 360
            ? MediaQuery.sizeOf(context).height / 800
            : 0.35,
        style: Get.textTheme.displayLarge,
      ),
      const EmptySpacingWidget(heightRatio: 26 / 800).build(context),
      LabelPasswordTextFieldWidget(
        label: 'Password',
        controller: Get.find<AuthViewModel>().passwordController,
        hint: 'Password',
        leftPadding: 17,
        rightPadding: 19,
        keyboardType: TextInputType.emailAddress,
        spacingBetween: 15,
        onEditingComplete: () => Get.focusScope!.nextFocus(),
        autoFocus: true,
        hiddenInputText: true,
      ),
      const SizedBox(height: 25),
      LabelPasswordTextFieldWidget(
        label: 'Confirm password',
        controller: Get.find<AuthViewModel>().confirmPasswordController,
        hint: 'Confirm password',
        leftPadding: 17,
        rightPadding: 19,
        keyboardType: TextInputType.emailAddress,
        spacingBetween: 15,
        onEditingComplete: () => Get.focusScope!.nextFocus(),
        autoFocus: true,
        hiddenInputText: true,
      ),
      const EmptySpacingWidget(heightRatio: 108 / 800).build(context),
      ElevatedButton(
        onPressed: () {},
        style: Get.theme.elevatedButtonTheme.style?.copyWith(
          fixedSize: MaterialStatePropertyAll(
            Size(MediaQuery.sizeOf(context).width * (284 / 360), 51),
          ),
        ),
        child: const Text('Login'),
      ),
    ];
  }
}
