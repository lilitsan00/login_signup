import 'package:flutter/material.dart';
import 'package:login_signup/constants/colors.dart';
import 'package:login_signup/constants/constants.dart';
import 'package:login_signup/extension/string_extension.dart';
import 'package:login_signup/screens/authentication/auth_store.dart';
import 'package:provider/provider.dart';

class SignupFieldsWidget extends StatefulWidget {
  const SignupFieldsWidget({super.key});
  @override
  State<SignupFieldsWidget> createState() => _SignupFieldsWidgetState();
}

class _SignupFieldsWidgetState extends State<SignupFieldsWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24 * grw(context)),
        child: Column(
          children: [
            _TextFieldWidget(
              hintText: "Email",
              controller: _emailController,
              focusNode: _emailFocus,
              textInputAction: TextInputAction.next,
              validator: (value) => value.emailValidator(),
              onFieldSubmitted:
                  (_) => FocusScope.of(context).requestFocus(_usernameFocus),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12 * grw(context)),
              child: _TextFieldWidget(
                hintText: 'Username',
                controller: _usernameController,
                focusNode: _usernameFocus,
                textInputAction: TextInputAction.next,
                validator: (value) => value.usernameValidator(),
                onFieldSubmitted:
                    (_) => FocusScope.of(context).requestFocus(_passwordFocus),
              ),
            ),
            _TextFieldWidget(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
              focusNode: _passwordFocus,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _onSubmit(),
              validator: (value) => value.passwordValidator(),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    final authStore = Provider.of<AuthStore>(context, listen: false);

    if (_formKey.currentState?.validate() == true) {
      authStore.register(
        _usernameController.text,
        _emailController.text,
        _passwordController.text,
      );
    }
  }
}

class LoginFieldsWidget extends StatefulWidget {
  const LoginFieldsWidget({super.key});
  @override
  State<LoginFieldsWidget> createState() => _LoginFieldsWidgetState();
}

class _LoginFieldsWidgetState extends State<LoginFieldsWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24 * grw(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12 * grw(context)),
              child: _TextFieldWidget(
                hintText: 'Username',
                controller: _usernameController,
                focusNode: _usernameFocus,
                textInputAction: TextInputAction.next,
                validator: (value) => value.usernameValidator(),
                onFieldSubmitted:
                    (_) => FocusScope.of(context).requestFocus(_passwordFocus),
              ),
            ),
            _TextFieldWidget(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
              focusNode: _passwordFocus,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _onSubmit(),
              validator: (value) => value.passwordValidator(),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    final authStore = Provider.of<AuthStore>(context, listen: false);
    if (_formKey.currentState?.validate() == true) {
      authStore.login(_usernameController.text, _passwordController.text);
    }
  }
}

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({
    required this.controller,
    required this.focusNode,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  final String? hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final FocusNode focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      focusNode: focusNode,
      style: TextStyle(
        fontSize: 16 * grw(context),
        color: AppColorScheme.foreground.getColor(context),
      ),
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12 * grw(context),
          horizontal: 16 * grw(context),
        ),
        hintStyle: TextStyle(
          fontSize: 16 * grw(context),
          color: AppColorScheme.foreground.getColor(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: AppColorScheme.primary.getColor(context),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: AppColorScheme.primary.getColor(context),
          ),
        ),
      ),
    );
  }
}
