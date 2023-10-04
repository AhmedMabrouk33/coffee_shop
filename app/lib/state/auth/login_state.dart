import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/screen_state_name.dart' show authSignUpState;

import '../../viewmodel/auth_viewmodel.dart';

// Custom Widgets.
import '../../utils/widgets/spacing/empty_spacing.dart';
import '../../utils/widgets/custom_clipper/custom_clipper_widget.dart';
import '../../utils/widgets/text_field/lable_text_field_widget.dart';
import '../../utils/widgets/checkBox/custom_checkbox.dart';

class AuthLoginState extends StatelessWidget {
  const AuthLoginState({super.key});

  Path _loginStateClipPath({
    required Size size,
    required double containerHeight,
    required double containerWidth,
  }) {
    var currentPath = Path()..moveTo(0, 0);
    currentPath.lineTo(containerWidth, 0);
    currentPath.cubicTo(
      containerWidth,
      150.61 * (containerHeight / 260),
      316.98 * (containerWidth / 360),
      185.5 * (containerHeight / 260),
      249.6 * (containerWidth / 360),
      185.5 * (containerHeight / 260),
    );
    currentPath.lineTo(
      112.8 * (containerWidth / 360),
      185.5 * (containerHeight / 260),
    );
    currentPath.cubicTo(
      70.45 * (containerWidth / 360),
      185.5 * (containerHeight / 260),
      0.69 * (containerWidth / 360),
      205.34 * (containerHeight / 260),
      0,
      containerHeight,
    );

    currentPath.close();
    return currentPath;
  }

  @override
  Widget build(BuildContext context) {
    print('Welcome to Auth State');
    var authController = Get.find<AuthViewModel>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * (260 / 800),
          width: double.infinity,
          child: ClipPath(
            clipper: MyCustomClipper(
              containerHeight: MediaQuery.sizeOf(context).height * (260 / 800),
              containerWidth: MediaQuery.sizeOf(context).width,
              clipPathFunc: _loginStateClipPath,
            ),
            child: _clipperChild(context),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                LabelTextFieldWidget(
                  label: 'Email',
                  autoFocus: true,
                  controller: authController.emailController,
                  autoChangeFocus: true,
                  hint: 'Email',
                  leftPadding: 23,
                  rightPadding: 13,
                  spacingBetween: 15,
                  keyboardType: TextInputType.emailAddress,
                ),
                const EmptySpacingWidget(heightRatio: 25 / 800).build(context),
                LabelTextFieldWidget(
                  label: 'password',
                  autoFocus: true,
                  controller: authController.passwordController,
                  autoChangeFocus: true,
                  hint: 'Password',
                  leftPadding: 23,
                  rightPadding: 13,
                  spacingBetween: 15,
                  keyboardType: TextInputType.visiblePassword,
                  hiddenInputText: true,
                ),
                const EmptySpacingWidget(heightRatio: 32 / 800).build(context),
                _rememberMeRow(context),
                const EmptySpacingWidget(heightRatio: 65 / 800).build(context),
                ElevatedButton(
                  onPressed: () {},
                  style: Get.theme.elevatedButtonTheme.style?.copyWith(
                    fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width * (254 / 360), 51),
                    ),
                  ),
                  child: const Text('Login'),
                ),
                const EmptySpacingWidget(heightRatio: 86 / 800).build(context),
                _signUpRowWidgets,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _clipperChild(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * (65 / 800),
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

  Widget _rememberMeRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 30.5),
        GetBuilder<AuthViewModel>(
          id: const ObjectKey('remember_me_flag'),
          builder: (authController) {
            return CustomCheckBox(
              spacingWidth: 5,
              label: 'Remember me',
              onTap: authController.rememberMeAction,
              isSelected: authController.isRememberMe,
              checkboxWidth: 25,
              checkboxHeight: 25,
              checkIconSize: 25,
              checkIconColor: Colors.white,
              fillBackgroundColor: const Color(0xffBA9062),
              labelStyle: const TextStyle(),
              checkboxBorderRadius: 5,
              autoFocus: true,
            );
          },
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text('Forget Password?'),
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget get _signUpRowWidgets {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Don't have an account?"),
        const SizedBox(width: 18),
        TextButton(
          onPressed: () =>
              Get.find<AuthViewModel>().navigateToNewState(authSignUpState),
          child: const Text('SIGN UP'),
        ),
      ],
    );
  }
}
