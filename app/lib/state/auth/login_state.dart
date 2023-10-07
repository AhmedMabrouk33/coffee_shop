import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/screen_state_name.dart'
    show authSignUpState, authForgetPasswordState;

import '../../viewmodel/auth_viewmodel.dart';

// Custom Widgets.
import '../../utils/widgets/spacing/empty_spacing.dart';
import '../../utils/widgets/checkBox/custom_checkbox.dart';
import '../../utils/widgets/text_field/lable_text_field_widget.dart';
import '../../utils/widgets/custom_clipper/custom_clipper_widget.dart';
import '../../utils/widgets/text_field/label_password_text_field.dart';

class AuthLoginState extends StatelessWidget {
  const AuthLoginState({super.key});

  Path _loginStateClipPath(Size size) {
    var currentPath = Path()..moveTo(0, 0);
    double heightRatio = (size.height / 260);
    double widthRatio = (size.width / 360);

    currentPath.lineTo(size.width, 0);
    currentPath.cubicTo(
      size.width,
      150.61 * heightRatio,
      316.98 * widthRatio,
      185.5 * heightRatio,
      249.6 * widthRatio,
      185.5 * heightRatio,
    );
    currentPath.lineTo(
      112.8 * widthRatio,
      185.5 * heightRatio,
    );
    currentPath.cubicTo(
      70.45 * widthRatio,
      185.5 * heightRatio,
      0.69 * widthRatio,
      205.34 * heightRatio,
      0,
      size.height,
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
            clipper: MyCustomClipper(clipPathFunc: _loginStateClipPath),
            child: _loginHeaderWidget(context),
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
                // ? Email Text field.
                LabelTextFieldWidget(
                  label: 'Email',
                  autoFocus: true,
                  controller: authController.emailController,
                  hint: 'Email',
                  leftPadding: 23,
                  rightPadding: 13,
                  spacingBetween: 15,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () => Get.focusScope!.nextFocus(),
                ),
                const EmptySpacingWidget(heightRatio: 25 / 800).build(context),

                // ? Password Text field.
                LabelPasswordTextFieldWidget(
                  label: 'password',
                  autoFocus: true,
                  controller: authController.passwordController,
                  hint: 'Password',
                  leftPadding: 23,
                  rightPadding: 13,
                  spacingBetween: 15,
                  keyboardType: TextInputType.visiblePassword,
                  hiddenInputText: true,
                  onEditingComplete: () => Get.focusScope!.nextFocus(),
                ),
                const EmptySpacingWidget(heightRatio: 32 / 800).build(context),

                // ? Remember me Row.
                _rememberMeRow(context),
                const EmptySpacingWidget(heightRatio: 65 / 800).build(context),

                // ? Login Elevated button.
                ElevatedButton(
                  onPressed: Get.find<AuthViewModel>().loginAction,
                  style: Get.theme.elevatedButtonTheme.style?.copyWith(
                    fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width * (254 / 360), 51),
                    ),
                  ),
                  child: const Text('Login'),
                ),
                const EmptySpacingWidget(heightRatio: 86 / 800).build(context),

                // ? Sign up Row.
                _signUpRowWidgets,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginHeaderWidget(BuildContext context) {
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
              autoFocus: false,
            );
          },
        ),
        const Spacer(),
        TextButton(
          onPressed: () => Get.find<AuthViewModel>()
              .navigateToNewState(authForgetPasswordState),
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
