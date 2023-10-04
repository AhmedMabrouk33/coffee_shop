import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodel/auth_viewmodel.dart';

import '../../utils/widgets/spacing/empty_spacing.dart';
import '../../utils/widgets/text_field/lable_text_field_widget.dart';
import '../../utils/widgets/custom_clipper/custom_clipper_widget.dart';

class AuthSignUpState extends StatelessWidget {
  const AuthSignUpState({super.key});

  Path _signUpPath(
    Size size,
  ) {
    var currentPath = Path()..moveTo(0, 0);
    double heightRatio = (size.height / 200);
    double widthRatio = (size.width / 360);

    currentPath.lineTo(size.width, 0);
    currentPath.cubicTo(
      size.width,
      20.0 * heightRatio,
      356.79 * widthRatio,
      106.52 * heightRatio,
      305.98 * widthRatio,
      108 * heightRatio,
    );
    currentPath.lineTo(
      59.0 * widthRatio,
      108.0 * heightRatio,
    );
    currentPath.cubicTo(
      13.72 * widthRatio,
      105.52 * heightRatio,
      3.38 * widthRatio,
      130.12 * heightRatio,
      0,
      size.height,
    );

    currentPath.close();
    return currentPath;
  }

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _signUpHeaderWidget(context),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                LabelTextFieldWidget(
                  label: 'User name',
                  controller: authController.userNameController,
                  hint: 'User name',
                  leftPadding: 18,
                  rightPadding: 18,
                  keyboardType: TextInputType.text,
                  spacingBetween: 15,
                  autoFocus: true,
                  onEditingComplete: () => Get.focusScope!.nextFocus(),
                ),
                const EmptySpacingWidget(heightRatio: 25 / 800).build(context),
                LabelTextFieldWidget(
                  autoFocus: true,
                  label: 'Email',
                  controller: authController.emailController,
                  hint: 'Email',
                  leftPadding: 18,
                  rightPadding: 18,
                  keyboardType: TextInputType.emailAddress,
                  spacingBetween: 15,
                  onEditingComplete: () => Get.focusScope!.nextFocus(),
                ),
                const EmptySpacingWidget(heightRatio: 25 / 800).build(context),
                LabelTextFieldWidget(
                  autoFocus: true,
                  label: 'Password',
                  controller: authController.passwordController,
                  hint: 'Password',
                  leftPadding: 18,
                  rightPadding: 18,
                  keyboardType: TextInputType.visiblePassword,
                  spacingBetween: 15,
                  hiddenInputText: true,
                  onEditingComplete: () => Get.focusScope!.nextFocus(),
                ),
                const EmptySpacingWidget(heightRatio: 25 / 800).build(context),
                LabelTextFieldWidget(
                  autoFocus: true,
                  label: 'Confirm Password',
                  controller: authController.confirmPasswordController,
                  hint: 'Confirm Password',
                  leftPadding: 18,
                  rightPadding: 18,
                  keyboardType: TextInputType.visiblePassword,
                  spacingBetween: 15,
                  hiddenInputText: true,
                  onEditingComplete: () => Get.focusScope!.nextFocus(),
                ),
                const EmptySpacingWidget(heightRatio: 25 / 800).build(context),
                ElevatedButton(
                  // autofocus: true,
                  onPressed: () {},
                  style: Get.theme.elevatedButtonTheme.style?.copyWith(
                    foregroundColor:
                        const MaterialStatePropertyAll(Color(0xff203354)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xffE4D7C3)),
                    fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width * (200 / 360), 40),
                    ),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    textStyle: const MaterialStatePropertyAll(
                      TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _signUpClipperWidget(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * (200 / 800),
      // padding: EdgeInsets.only(
      //   top: MediaQuery.sizeOf(context).height * (40 / 800),
      // ),
      color: Colors.white,
/*
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topStart,
        children: [
          Positioned(
            top: 0,
            height: MediaQuery.sizeOf(context).height * (200 / 800),
            width: MediaQuery.sizeOf(context).width,
            child: InkWell(
              onTap: Get.find<AuthViewModel>().popCurrentState,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 38),
                  IconButton(
                    onPressed: Get.find<AuthViewModel>().popCurrentState,
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xffBA9062),
                      foregroundColor: const Color(0xffE4D7C3),
                      iconSize: 40,
                      shape: const CircleBorder(),
                      alignment: AlignmentDirectional.center,
                      fixedSize: const Size(24, 24),
                      padding: const EdgeInsets.all(0),
                    ),
                    icon: const Icon(
                      Icons.arrow_left_outlined,
                      // size: 24,
                    ),
                  ),
                  const SizedBox(width: 27),
                  Text(
                    'Create Account',
                    style: Get.textTheme.titleMedium?.copyWith(
                      color: const Color(0xffBA9062),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
*/
    );
  }

  Widget _signUpHeaderWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * (200 / 800),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * (200 / 800),
            child: ClipPath(
              clipper: MyCustomClipper(
                clipPathFunc: _signUpPath,
              ),
              child: _signUpClipperWidget(context),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {},
              style: Get.theme.elevatedButtonTheme.style?.copyWith(
                iconSize: const MaterialStatePropertyAll(24),
                fixedSize: MaterialStatePropertyAll(
                  Size(
                    MediaQuery.sizeOf(context).width * (100 / 360),
                    50,
                  ),
                ),
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(40.5),
                    ),
                  ),
                ),
              ),
              child: const Icon(
                Icons.add_a_photo_rounded,
                size: 24,
              ),
            ),
          ),

          // TODO: Add Image which will update when user select image from device.
          Positioned(
            bottom: 0,
            // height: MediaQuery.sizeOf(context).height * (200 / 800),
            width: MediaQuery.sizeOf(context).width,
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => print("Add Image is pressed"),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.sizeOf(context).width * (120 / 360),
                  height: MediaQuery.sizeOf(context).height * (120 / 800),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffD9D9D9),
                  ),
                ),
              ),
            ),
          ),

          // Pop Sign up State Row.
          Positioned(
            top: MediaQuery.sizeOf(context).height * (40 / 800),
            // height: MediaQuery.sizeOf(context).height * (200 / 800),
            width: MediaQuery.sizeOf(context).width,
            child: InkWell(
              onTap: Get.find<AuthViewModel>().popCurrentState,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 38),
                  IconButton(
                    onPressed: Get.find<AuthViewModel>().popCurrentState,
                    icon: const Icon(Icons.arrow_left_outlined),
                  ),
                  const SizedBox(width: 27),
                  Text(
                    'Create Account',
                    style: Get.textTheme.titleMedium?.copyWith(
                      color: const Color(0xffBA9062),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
  Positioned(
    child: SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: InkWell(
        onTap: () => print('Clipper pressed'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const EmptySpacingWidget(widthRatio: 38 / 360)
                .build(context),
            Text('data')
            // IconButton(
            //   onPressed: () {},
            //   style: Get.theme.iconButtonTheme.style?.copyWith(
            //     iconColor: MaterialStatePropertyAll((Colors.amber)),
            //     fixedSize: MaterialStatePropertyAll(Size(50, 50)),
            //   ),
            //   icon: const Icon(Icons.label),
            // ),
          ],
        ),
      ),
    ),
  ),
*/