import 'package:flutter/material.dart';
import 'package:login_signup/constants/colors.dart';
import 'package:login_signup/constants/constants.dart';

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({
    super.key,
    required this.isLogin,
    required this.toggleForm,
  });
  final bool isLogin;
  final VoidCallback? toggleForm;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 * grw(context)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 30 * grw(context),
              bottom: 52 * grw(context),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20 * grw(context)),
                color: AppColorScheme.secondary.getColor(context),
              ),
              child: Row(
                children: [
                  ButtonWidget(
                    text: "Login",
                    isSelected: isLogin,
                    onTap: toggleForm,
                  ),
                  ButtonWidget(
                    text: "Sign-up",
                    isSelected: !isLogin,
                    onTap: toggleForm,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot password?',
              style: TextStyle(
                color: AppColorScheme.royalBlue.getColor(context),
                fontSize: 14 * grw(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10 * grw(context)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isSelected
                    ? AppColorScheme.royalBlue.light
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14 * grw(context),
              color:
                  isSelected
                      ? AppColorScheme.background.light
                      : AppColorScheme.foreground.getColor(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
